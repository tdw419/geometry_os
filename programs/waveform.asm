; waveform.asm -- Waveform Oscilloscope
;
; Controls:
;   1/2/3   Switch waveform (sine/square/sawtooth)
;   N      Toggle noise mode
;   UP/DOWN or W/X  Adjust frequency (100-2000 Hz, step 50)
;   LEFT/RIGHT or A/D  Adjust amplitude (20-100%, step 10)
;   S      Trigger BEEP at current frequency
;   R      Reset to defaults
;
; Memory layout:
;   0x2000  wave_type (0=sine, 1=square, 2=sawtooth, 3=noise)
;   0x2001  frequency (100-2000 Hz)
;   0x2002  amplitude (20-100)
;   0x2003  phase (frame counter for animation)
;   0x3000  sine table (256 entries, values 128-255)
;   0x5000  text buffer for HUD

; ═══════════════════════════════════════════════════════════════
; ENTRY
; ═══════════════════════════════════════════════════════════════
  LDI r30, 0xFE00
  LDI r7, 1

  ; Build sine table
  PUSH r31
  CALL build_sine_table
  POP r31

  ; Defaults: wave=0, freq=400, amp=70, phase=0
  LDI r17, 0x2000
  LDI r18, 0
  STORE r17, r18
  ADD r17, r7
  LDI r18, 400
  STORE r17, r18
  ADD r17, r7
  LDI r18, 70
  STORE r17, r18
  ADD r17, r7
  LDI r18, 0
  STORE r17, r18

  JMP main_loop

; ═══════════════════════════════════════════════════════════════
; BUILD SINE TABLE -- 256 entries at 0x3000
; Parabolic cosine: 255 - 127*(i-128)^2/16384, range 128-255
; ═══════════════════════════════════════════════════════════════
build_sine_table:
  LDI r16, 0x3000
  LDI r15, 256
  LDI r10, 0

sine_loop:
  LDI r18, 128
  MOV r17, r10
  CMP r17, r18
  BLT r0, below_128
  MOV r17, r10
  SUB r17, r18
  JMP do_sq
below_128:
  MOV r17, r18
  SUB r17, r10
do_sq:
  MUL r17, r17
  LDI r18, 127
  MUL r17, r18
  LDI r18, 16384
  DIV r17, r18
  LDI r18, 255
  SUB r18, r17
  MOV r19, r16
  ADD r19, r10
  STORE r19, r18
  ADD r10, r7
  CMP r10, r15
  BLT r0, sine_loop
  RET

; ═══════════════════════════════════════════════════════════════
; MAIN LOOP
; ═══════════════════════════════════════════════════════════════
main_loop:
  LDI r9, 0
  FILL r9

  ; Read input into r21, keep r7=1
  IKEY r21
  JZ r21, no_input
  PUSH r31
  CALL handle_input
  POP r31
no_input:

  PUSH r31
  CALL draw_grid
  POP r31

  PUSH r31
  CALL draw_waveform
  POP r31

  PUSH r31
  CALL draw_hud
  POP r31

  ; Advance phase
  LDI r17, 0x2003
  LOAD r18, r17
  LDI r19, 4
  ADD r18, r19
  STORE r17, r18

  FRAME
  JMP main_loop

; ═══════════════════════════════════════════════════════════════
; HANDLE INPUT -- r21 = key code
; ═══════════════════════════════════════════════════════════════
handle_input:
  ; 1 = sine
  LDI r18, 49
  CMP r21, r18
  JNZ r21, hi_2
  LDI r17, 0x2000
  LDI r18, 0
  STORE r17, r18
  RET

hi_2:
  LDI r18, 50
  CMP r21, r18
  JNZ r21, hi_3
  LDI r17, 0x2000
  LDI r18, 1
  STORE r17, r18
  RET

hi_3:
  LDI r18, 51
  CMP r21, r18
  JNZ r21, hi_n
  LDI r17, 0x2000
  LDI r18, 2
  STORE r17, r18
  RET

hi_n:
  LDI r18, 78
  CMP r21, r18
  JNZ r21, hi_s
  LDI r17, 0x2000
  LDI r18, 3
  STORE r17, r18
  RET

hi_s:
  LDI r18, 83
  CMP r21, r18
  JNZ r21, hi_r
  LDI r17, 0x2001
  LOAD r18, r17
  LDI r19, 200
  BEEP r18, r19
  RET

hi_r:
  LDI r18, 82
  CMP r21, r18
  JNZ r21, hi_up
  LDI r17, 0x2000
  LDI r18, 0
  STORE r17, r18
  ADD r17, r7
  LDI r18, 400
  STORE r17, r18
  ADD r17, r7
  LDI r18, 70
  STORE r17, r18
  ADD r17, r7
  LDI r18, 0
  STORE r17, r18
  RET

hi_up:
  ; UP=140 or W=87 => freq+50
  LDI r18, 140
  CMP r21, r18
  JZ r0, do_fu
  LDI r18, 87
  CMP r21, r18
  JNZ r21, hi_dn
do_fu:
  LDI r17, 0x2001
  LOAD r18, r17
  LDI r19, 50
  ADD r18, r19
  LDI r19, 2000
  CMP r18, r19
  BLT r0, fu_ok
  MOV r18, r19
fu_ok:
  STORE r17, r18
  RET

hi_dn:
  ; DOWN=145 or X=88 => freq-50
  LDI r18, 145
  CMP r21, r18
  JZ r0, do_fd
  LDI r18, 88
  CMP r21, r18
  JNZ r21, hi_lt
do_fd:
  LDI r17, 0x2001
  LOAD r18, r17
  LDI r19, 50
  SUB r18, r19
  LDI r19, 100
  CMP r18, r19
  BGE r0, fd_ok
  MOV r18, r19
fd_ok:
  STORE r17, r18
  RET

hi_lt:
  ; LEFT=141 or A=65 => amp-10
  LDI r18, 141
  CMP r21, r18
  JZ r0, do_ad
  LDI r18, 65
  CMP r21, r18
  JNZ r21, hi_rt
do_ad:
  LDI r17, 0x2002
  LOAD r18, r17
  LDI r19, 10
  SUB r18, r19
  LDI r19, 20
  CMP r18, r19
  BGE r0, ad_ok
  MOV r18, r19
ad_ok:
  STORE r17, r18
  RET

hi_rt:
  ; RIGHT=142 or D=68 => amp+10
  LDI r18, 142
  CMP r21, r18
  JZ r0, do_au
  LDI r18, 68
  CMP r21, r18
  JNZ r21, hi_done
do_au:
  LDI r17, 0x2002
  LOAD r18, r17
  LDI r19, 10
  ADD r18, r19
  LDI r19, 100
  CMP r18, r19
  BLT r0, au_ok
  MOV r18, r19
au_ok:
  STORE r17, r18
hi_done:
  RET

; ═══════════════════════════════════════════════════════════════
; DRAW GRID -- subtle oscilloscope background grid
; ═══════════════════════════════════════════════════════════════
draw_grid:
  ; Center horizontal line at y=128, color 0x1A1A1A
  LDI r18, 0x1A1A1A
  LDI r10, 0
  LDI r11, 128
dg_hloop:
  PSET r10, r11, r18
  ADD r10, r7
  LDI r19, 256
  CMP r10, r19
  BLT r0, dg_hloop

  ; Quarter lines at y=64 and y=192, color 0x111111
  LDI r18, 0x111111
  LDI r10, 0
  LDI r11, 64
dg_q1:
  PSET r10, r11, r18
  ADD r10, r7
  LDI r19, 256
  CMP r10, r19
  BLT r0, dg_q1

  LDI r10, 0
  LDI r11, 192
dg_q2:
  PSET r10, r11, r18
  ADD r10, r7
  LDI r19, 256
  CMP r10, r19
  BLT r0, dg_q2

  ; Vertical ticks every 32px at y=128, color 0x0D0D0D
  LDI r18, 0x0D0D0D
  LDI r10, 32
  LDI r11, 128
dg_vloop:
  PSET r10, r11, r18
  ADD r10, r7
  LDI r19, 256
  CMP r10, r19
  BLT r0, dg_vloop

  RET

; ═══════════════════════════════════════════════════════════════
; DRAW WAVEFORM
; ═══════════════════════════════════════════════════════════════
draw_waveform:
  ; Load params: r8=type, r9=freq, r14=amp, r15=phase
  LDI r17, 0x2000
  LOAD r8, r17
  ADD r17, r7
  LOAD r9, r17
  ADD r17, r7
  LOAD r14, r17
  ADD r17, r7
  LOAD r15, r17

  ; amp_px = amplitude * 128 / 100
  MOV r16, r14
  LDI r19, 128
  MUL r16, r19
  LDI r19, 100
  DIV r16, r19

  ; cycles = frequency / 100
  MOV r20, r9
  LDI r19, 100
  DIV r20, r19

  ; Color: 0=sine 0x00FF88, 1=sq 0xFF8800, 2=saw 0x0088FF, 3=noise 0xFF00FF
  LDI r21, 0x00FF88
  LDI r18, 1
  CMP r8, r18
  JNZ r0, dw_ck2
  LDI r21, 0xFF8800
  JMP dw_col_done
dw_ck2:
  LDI r18, 2
  CMP r8, r18
  JNZ r0, dw_ck3
  LDI r21, 0x0088FF
  JMP dw_col_done
dw_ck3:
  LDI r18, 3
  CMP r8, r18
  JNZ r0, dw_col_done
  LDI r21, 0xFF00FF
dw_col_done:

  ; prev_y = 128
  LDI r22, 128
  ; prev_x = 0
  LDI r23, 0

  ; x loop 0..255
  LDI r10, 0

dw_xloop:
  ; Compute table index
  MOV r17, r10
  MUL r17, r20
  LDI r19, 256
  MUL r17, r19
  ADD r17, r15
  LDI r19, 255
  AND r17, r19

  ; Branch on type
  LDI r18, 3
  CMP r8, r18
  JNZ r0, dw_not_ns

  ; NOISE: use (x+phase) & 0xFF as index
  MOV r17, r10
  ADD r17, r15
  AND r17, r19
  LDI r19, 0x3000
  ADD r17, r19
  LOAD r17, r17
  LDI r19, 128
  SUB r17, r19
  JMP dw_comp_y

dw_not_ns:
  LDI r18, 1
  CMP r8, r18
  JNZ r0, dw_not_sq

  ; SQUARE: table > 191 ? +120 : -120
  LDI r19, 0x3000
  MOV r18, r17
  ADD r18, r19
  LOAD r18, r18
  LDI r19, 191
  CMP r18, r19
  BGE r0, dw_sq_hi
  LDI r17, 120
  NEG r17
  JMP dw_comp_y
dw_sq_hi:
  LDI r17, 120
  JMP dw_comp_y

dw_not_sq:
  LDI r18, 2
  CMP r8, r18
  JNZ r0, dw_sine

  ; SAWTOOTH: index - 128
  LDI r19, 128
  SUB r17, r19
  JMP dw_comp_y

dw_sine:
  ; SINE: table lookup - 128
  LDI r19, 0x3000
  ADD r17, r19
  LOAD r17, r17
  LDI r19, 128
  SUB r17, r19

dw_comp_y:
  ; y_offset = value * amp_px / 128
  MUL r17, r16
  LDI r19, 128
  DIV r17, r19

  ; y = 128 - y_offset
  LDI r18, 128
  SUB r18, r17

  ; Clamp 12..243
  LDI r19, 12
  CMP r18, r19
  BGE r0, dw_ylo
  MOV r18, r19
dw_ylo:
  LDI r19, 243
  CMP r18, r19
  BLT r0, dw_yhi
  MOV r18, r19
dw_yhi:

  ; Draw line from (prev_x, prev_y) to (x, y)
  ; Skip first pixel (no prev)
  JZ r23, dw_first
  LINE r23, r22, r10, r18, r21
  JMP dw_next

dw_first:
  PSET r10, r18, r21

dw_next:
  MOV r22, r18
  MOV r23, r10
  ADD r10, r7
  LDI r19, 256
  CMP r10, r19
  BLT r0, dw_xloop

  RET

; ═══════════════════════════════════════════════════════════════
; DRAW HUD -- top and bottom info bars
; ═══════════════════════════════════════════════════════════════
draw_hud:
  ; Top bar: dark background
  LDI r19, 256
  LDI r20, 12
  LDI r18, 0x111122
  LDI r21, 0
  RECTF r21, r21, r19, r20, r18

  ; Build text at 0x5000
  LDI r17, 0x5000

  ; Wave type name
  LDI r19, 0x2000
  LOAD r8, r19
  LDI r19, 0
  CMP r8, r19
  JNZ r0, dh_sq
  CALL dh_str_sine
  JMP dh_freq
dh_sq:
  LDI r19, 1
  CMP r8, r19
  JNZ r0, dh_sw
  CALL dh_str_sqr
  JMP dh_freq
dh_sw:
  LDI r19, 2
  CMP r8, r19
  JNZ r0, dh_ns
  CALL dh_str_saw
  JMP dh_freq
dh_ns:
  CALL dh_str_noise

dh_freq:
  ; Space
  LDI r18, 32
  STORE r17, r18
  ADD r17, r7

  ; Frequency as decimal
  LDI r19, 0x2001
  LOAD r14, r19
  CALL uint_to_str

  ; "Hz "
  LDI r18, 72
  STORE r17, r18
  ADD r17, r7
  LDI r18, 122
  STORE r17, r18
  ADD r17, r7
  LDI r18, 32
  STORE r17, r18
  ADD r17, r7

  ; Amplitude
  LDI r19, 0x2002
  LOAD r14, r19
  CALL uint_to_str

  ; "%"
  LDI r18, 37
  STORE r17, r18
  ADD r17, r7
  LDI r18, 0
  STORE r17, r18

  ; Render text
  LDI r11, 4
  LDI r12, 3
  LDI r10, 0x5000
  LDI r19, 0x00CCFF
  LDI r20, 0x111122
  SMALLTEXT r11, r12, r10, r19, r20

  ; Bottom bar
  LDI r18, 0x111122
  LDI r19, 256
  LDI r20, 12
  LDI r21, 0
  RECTF r21, r21, r19, r20, r18

  ; Controls text at 0x5000
  LDI r17, 0x5000
  CALL dh_str_controls

  LDI r11, 4
  LDI r12, 246
  LDI r10, 0x5000
  LDI r19, 0x666688
  LDI r20, 0x111122
  SMALLTEXT r11, r12, r10, r19, r20

  RET

; ── String helpers for HUD ──────────────────────────────────────

dh_str_sine:
  LDI r18, 83
  STORE r17, r18
  ADD r17, r7
  LDI r18, 73
  STORE r17, r18
  ADD r17, r7
  LDI r18, 78
  STORE r17, r18
  ADD r17, r7
  LDI r18, 69
  STORE r17, r18
  ADD r17, r7
  RET

dh_str_sqr:
  LDI r18, 83
  STORE r17, r18
  ADD r17, r7
  LDI r18, 81
  STORE r17, r18
  ADD r17, r7
  LDI r18, 82
  STORE r17, r18
  ADD r17, r7
  RET

dh_str_saw:
  LDI r18, 83
  STORE r17, r18
  ADD r17, r7
  LDI r18, 65
  STORE r17, r18
  ADD r17, r7
  LDI r18, 87
  STORE r17, r18
  ADD r17, r7
  RET

dh_str_noise:
  LDI r18, 78
  STORE r17, r18
  ADD r17, r7
  LDI r18, 79
  STORE r17, r18
  ADD r17, r7
  LDI r18, 73
  STORE r17, r18
  ADD r17, r7
  LDI r18, 83
  STORE r17, r18
  ADD r17, r7
  LDI r18, 69
  STORE r17, r18
  ADD r17, r7
  RET

dh_str_controls:
  ; "1:SIN 2:SQR 3:SAW N:NS S:SND"
  LDI r18, 49
  STORE r17, r18
  ADD r17, r7
  LDI r18, 58
  STORE r17, r18
  ADD r17, r7
  PUSH r31
  CALL dh_str_sine
  POP r31
  LDI r18, 32
  STORE r17, r18
  ADD r17, r7
  LDI r18, 50
  STORE r17, r18
  ADD r17, r7
  LDI r18, 58
  STORE r17, r18
  ADD r17, r7
  PUSH r31
  CALL dh_str_sqr
  POP r31
  LDI r18, 32
  STORE r17, r18
  ADD r17, r7
  LDI r18, 51
  STORE r17, r18
  ADD r17, r7
  LDI r18, 58
  STORE r17, r18
  ADD r17, r7
  PUSH r31
  CALL dh_str_saw
  POP r31
  LDI r18, 0
  STORE r17, r18
  RET

; ═══════════════════════════════════════════════════════════════
; UINT_TO_STR
; Convert r14 to decimal ASCII at r17. No null terminator.
; ═══════════════════════════════════════════════════════════════
uint_to_str:
  PUSH r31
  LDI r16, 0

  LDI r19, 0
  CMP r14, r19
  JNZ r0, uts_loop
  LDI r18, 48
  STORE r17, r18
  ADD r17, r7
  POP r31
  RET

uts_loop:
  MOV r20, r14
  LDI r19, 10
  DIV r20, r19
  MOV r21, r20
  LDI r22, 10
  MUL r21, r22
  MOV r23, r14
  SUB r23, r21
  PUSH r23
  ADD r16, r7
  MOV r14, r20
  LDI r19, 0
  CMP r14, r19
  JNZ r0, uts_loop

uts_write:
  JZ r16, uts_done
  POP r23
  LDI r19, 48
  ADD r23, r19
  STORE r17, r23
  ADD r17, r7
  LDI r19, 1
  SUB r16, r19
  JMP uts_write

uts_done:
  POP r31
  RET
