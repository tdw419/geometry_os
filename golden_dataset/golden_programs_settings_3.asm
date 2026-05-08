; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; settings.asm -- Settings Panel for Geometry OS
; Phase 77: Theme selection, volume control, config display
;
; Proves: RECTF panels, DRAWTEXT colored text, IKEY input,
;         RAM-based config state, visual UI with selection cursor.
;
; Controls:
;   Up/Down arrow (W/S) to move cursor
;   Left/Right arrow (A/D) or Enter to change value
;   Escape (key 27) to exit
;
; RAM Layout:
;   0x6900  theme_id (0-7, selects color palette)
;   0x6904  volume (0-100, beep volume level)
;   0x6908  cursor_pos (0-2, which setting is selected)
;   0x690C  key_repeat (1-5, key repeat speed)
;   0x6910  scratch buffer for text rendering
;
; NOTE: No colons in comments (assembler pitfall)

#define THEME    0x6900
#define VOLUME   0x6904
#define CURSOR   0x6908
#define KEYREPT  0x690C
#define SCRATCH  0x6910
#define TICKS    0xFFE

; 8 theme palettes (bg, fg, accent, panel)
; Stored as 4 consecutive u32 per theme at 0x7000
#define THEMES   0x7000

; =========================================
; INIT
; =========================================
start:
    LDI r30, 0xFD00

    ; Init defaults
    LDI r20, THEME
    LDI r21, 0
    STORE r20, r21

    LDI r20, VOLUME
    LDI r21, 50
    STORE r20, r21

    LDI r20, CURSOR
    LDI r21, 0
    STORE r20, r21

    LDI r20, KEYREPT
    LDI r21, 3
    STORE r20, r21

    ; Build theme table at THEMES
    ; Theme 0: Dark (navy bg, white fg, cyan accent, dark panel)
    LDI r20, THEMES
    LDI r21, 0x0D1B2A
    STORE r20, r21          ; bg
    ADDI r20, 1
    LDI r21, 0xE0E0E0
    STORE r20, r21          ; fg
    ADDI r20, 1
    LDI r21, 0x00B4D8
    STORE r20, r21          ; accent
    ADDI r20, 1
    LDI r21, 0x1B2838
    STORE r20, r21          ; panel

    ; Theme 1: Ocean
    ADDI r20, 1
    LDI r21, 0x0A1628
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x90E0EF
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x0077B6
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x142838
    STORE r20, r21

    ; Theme 2: Forest
    ADDI r20, 1
    LDI r21, 0x0A1A0A
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xA0D8A0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x2D6A2D
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x142814
    STORE r20, r21

    ; Theme 3: Sunset
    ADDI r20, 1
    LDI r21, 0x1A0A14
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFFD6A0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xE06040
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x281420
    STORE r20, r21

    ; Theme 4: Monochrome
    ADDI r20, 1
    LDI r21, 0x141414
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xC0C0C0
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x808080
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x202020
    STORE r20, r21

    ; Theme 5: Vaporwave
    ADDI r20, 1
    LDI r21, 0x1A0A2A
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFF71CE
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x01CDFE
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x200A30
    STORE r20, r21

    ; Theme 6: Amber
    ADDI r20, 1
    LDI r21, 0x1A1400
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFFB000
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0xFF8800
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x282000
    STORE r20, r21

    ; Theme 7: Matrix
    ADDI r20, 1
    LDI r21, 0x000A00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x00FF00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x00CC00
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0x001400
    STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
    IKEY r25
    JNZ r25, handle_key

    ; Load current theme
    LDI r20, THEME
    LOAD r22, r20
    SHLI r22, 2             ; theme * 4 words
    LDI r21, THEMES
    ADD r21, r22            ; ptr to theme colors

    LOAD r13, r21           ; bg color
    ADDI r21, 1
    LOAD r16, r21           ; fg color
    ADDI r21, 1
    LOAD r17, r21           ; accent color
    ADDI r21, 1
    LOAD r18, r21           ; panel color

    ; Clear with bg
    FILL r13

    ; ── Title bar ──
    LDI r0, 0
    LDI r3, 0
    LDI r9, 256
    LDI r6, 24
    RECTF r0, r3, r9, r6, r17

    ; Title text
    LDI r20, SCRATCH
    STRO r20, "SETTINGS"
    LDI r0, 0
    LDI r3, 6
    LDI r9, SCRATCH
    LDI r6, 0             ; fg=black on accent
    LDI r12, 0
    DRAWTEXT r0, r3, r9, r6, r12

    ; ── Settings Panel ──
    ; Panel background
    LDI r0, 16
    LDI r3, 32
    LDI r9, 224
    LDI r6, 192
    RECTF r0, r3, r9, r6, r18

    ; Load cursor position
    LDI r20, CURSOR
    LOAD r23, r20

    ; ── Draw Theme option (row 0) ──
    LDI r0, 24
    LDI r3, 44
    CMPI r23, 0
    JNZ r11, not_sel0
    ; Highlight selected row
    LDI r0, 17
    LDI r3, 40
    LDI r9, 222
    LDI r6, 28
    RECTF r0, r3, r9, r6, r17
    LDI r0, 24
    LDI r3, 44
not_sel0:
    LDI r20, SCRATCH
    STRO r20, "Theme"
    LDI r0, 24
    LDI r3, 44
    LDI r9, SCRATCH
    DRAWTEXT r0, r3, r9, r16, r13

    ; Theme value (0-7)
    LDI r20, THEME
    LOAD r22, r20
    LDI r20, SCRATCH
    ; Convert number to string at scratch+10
    ADDI r20, 10
    LDI r21, 48             ; ASCII '0'
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0
    STORE r20, r21          ; null terminator
    LDI r0, 140
    LDI r3, 44
    LDI r9, SCRATCH
    ADDI r9, 10
    LDI r6, 0xFFAA00       ; gold for value
    DRAWTEXT r0, r3, r9, r6, r13

    ; Theme name
    LDI r20, THEME
    LOAD r22, r20
    LDI r20, SCRATCH
    ADDI r20, 20
    ; Dispatch on theme id
    CMPI r22, 0
    JNZ r11, tnot0
    STRO r20, "Dark"
    JMP tname_done
tnot0:
    CMPI r22, 1
    JNZ r11, tnot1
    STRO r20, "Ocean"
    JMP tname_done
tnot1:
    CMPI r22, 2
    JNZ r11, tnot2
    STRO r20, "Forest"
    JMP tname_done
tnot2:
    CMPI r22, 3
    JNZ r11, tnot3
    STRO r20, "Sunset"
    JMP tname_done
tnot3:
    CMPI r22, 4
    JNZ r11, tnot4
    STRO r20, "Mono"
    JMP tname_done
tnot4:
    CMPI r22, 5
    JNZ r11, tnot5
    STRO r20, "Vaporwave"
    JMP tname_done
tnot5:
    CMPI r22, 6
    JNZ r11, tnot6
    STRO r20, "Amber"
    JMP tname_done
tnot6:
    STRO r20, "Matrix"
tname_done:
    LDI r0, 160
    LDI r3, 44
    LDI r9, SCRATCH
    ADDI r9, 20
    LDI r6, 0x808080
    DRAWTEXT r0, r3, r9, r6, r13

    ; ── Draw Volume option (row 1) ──
    LDI r0, 24
    LDI r3, 84
    CMPI r23, 1
    JNZ r11, not_sel1
    LDI r0, 17
    LDI r3, 80
    LDI r9, 222
    LDI r6, 28
    RECTF r0, r3, r9, r6, r17
    LDI r0, 24
    LDI r3, 84
not_sel1:
    LDI r20, SCRATCH
    STRO r20, "Volume"
    LDI r0, 24
    LDI r3, 84
    LDI r9, SCRATCH
    DRAWTEXT r0, r3, r9, r16, r13

    ; Volume bar
    LDI r20, VOLUME
    LOAD r22, r20
    ; Bar background
    LDI r0, 140
    LDI r3, 86
    LDI r9, 80
    LDI r6, 12
    LDI r12, 0x303030
    RECTF r0, r3, r9, r6, r12
    ; Bar fill (volume / 100 * 80)
    LDI r12, 80
    MUL r22, r12
    LDI r12, 100
    DIV r22, r12            ; fill_width = vol * 80 / 100
    LDI r0, 140
    LDI r3, 86
    LDI r6, 12
    RECTF r0, r3, r22, r6, r17

    ; Volume number
    LDI r20, VOLUME
    LOAD r22, r20
    LDI r20, SCRATCH
    ADDI r20, 30
    LDI r21, 48
    ; tens digit
    LDI r12, 10
    DIV r22, r12
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    ; ones digit
    LDI r21, 48
    LDI r22, VOLUME
    LOAD r22, r22
    LDI r12, 10
    MOD r22, r12
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0
    STORE r20, r21
    LDI r0, 226
    LDI r3, 84
    LDI r9, SCRATCH
    ADDI r9, 30
    LDI r6, 0xFFAA00
    DRAWTEXT r0, r3, r9, r6, r13

    ; ── Draw Key Repeat option (row 2) ──
    LDI r0, 24
    LDI r3, 124
    CMPI r23, 2
    JNZ r11, not_sel2
    LDI r0, 17
    LDI r3, 120
    LDI r9, 222
    LDI r6, 28
    RECTF r0, r3, r9, r6, r17
    LDI r0, 24
    LDI r3, 124
not_sel2:
    LDI r20, SCRATCH
    STRO r20, "Key Repeat"
    LDI r0, 24
    LDI r3, 124
    LDI r9, SCRATCH
    DRAWTEXT r0, r3, r9, r16, r13

    ; Key repeat dots (1-5)
    LDI r20, KEYREPT
    LOAD r22, r20
    ; Draw N filled dots
    LDI r0, 140
    LDI r3, 128
    LDI r12, 0
repeat_dots:
    CMP r12, r22
    BGE r11, dots_done
    LDI r9, 10
    LDI r6, 10
    RECTF r0, r3, r9, r6, r17
    ADDI r0, 14
    ADDI r12, 1
    JMP repeat_dots
dots_done:
    ; Draw (5-N) empty dots
    LDI r12, 0
empty_dots:
    CMP r12, r22
    BLT r11, skip_dot
    LDI r9, 10
    LDI r6, 10
    RECTF r0, r3, r9, r6, r12
    ; Use panel bg for empty dots
    RECTF r0, r3, r9, r6, r18
    ADDI r0, 14
skip_dot:
    ADDI r12, 1
    LDI r13, 5
    CMP r12, r13
    BLT r11, empty_dots

    ; Reload theme colors (r13-r18 were clobbered)
    LDI r20, THEME
    LOAD r22, r20
    SHLI r22, 2
    LDI r21, THEMES
    ADD r21, r22
    LOAD r13, r21
    ADDI r21, 1
    LOAD r16, r21
    ADDI r21, 1
    LOAD r17, r21
    ADDI r21, 1
    LOAD r18, r21

    ; ── Preview swatch ──
    LDI r0, 24
    LDI r3, 164
    LDI r9, 208
    LDI r6, 48
    RECTF r0, r3, r9, r6, r18

    ; Draw 4 small color swatches
    LDI r0, 32
    LDI r3, 170
    LDI r9, 40
    LDI r6, 36
    RECTF r0, r3, r9, r6, r13  ; bg
    ADDI r0, 48
    RECTF r0, r3, r9, r6, r16  ; fg
    ADDI r0, 48
    RECTF r0, r3, r9, r6, r17  ; accent
    ADDI r0, 48
    RECTF r0, r3, r9, r6, r18  ; panel

    ; Swatch labels
    LDI r20, SCRATCH
    STRO r20, "BG   FG   ACC  PAN"
    LDI r0, 32
    LDI r3, 210
    LDI r9, SCRATCH
    DRAWTEXT r0, r3, r9, r16, r13

    ; ── Help text at bottom ──
    LDI r0, 0
    LDI r3, 236
    LDI r9, 256
    LDI r6, 20
    RECTF r0, r3, r9, r6, r17
    LDI r20, SCRATCH
    STRO r20, "W/S Move  A/D Change  Esc Exit"
    LDI r0, 16
    LDI r3, 240
    LDI r9, SCRATCH
    LDI r6, 0             ; black on accent
    LDI r12, 0
    DRAWTEXT r0, r3, r9, r6, r12

    FRAME
    JMP main_loop

; ── Key handler ───────────────────────────────
handle_key:
    ; W = 87 (up), S = 83 (down)
    ; A = 65 (left/decrease), D = 68 (right/increase)
    ; Enter = 13, Escape = 27

    ; Escape
    CMPI r25, 27
    JNZ r11, not_esc
    HALT
not_esc:

    ; W (up)
    CMPI r25, 87
    JNZ r11, not_up
    LDI r20, CURSOR
    LOAD r22, r20
    JZ r22, main_loop       ; already at top
    SUBI r22, 1
    STORE r20, r22
    JMP main_loop
not_up:

    ; S (down)
    CMPI r25, 83
    JNZ r11, not_down
    LDI r20, CURSOR
    LOAD r22, r20
    CMPI r22, 2
    BGE r11, main_loop       ; already at bottom
    ADDI r22, 1
    STORE r20, r22
    JMP main_loop
not_down:

    ; A (left/decrease) or D (right/increase)
    LDI r26, 0              ; 0=decrease, 1=increase
    CMPI r25, 68
    JNZ r11, check_left
    LDI r26, 1
    JMP do_change
check_left:
    CMPI r25, 65
    JNZ r11, check_enter
    LDI r26, 0
    JMP do_change
check_enter:
    ; Enter = toggle/change based on cursor
    CMPI r25, 13
    JNZ r11, key_done
    LDI r26, 1
    ; Fall through to do_change

do_change:
    LDI r20, CURSOR
    LOAD r23, r20

    ; Cursor 0: theme (0-7)
    CMPI r23, 0
    JNZ r11, not_theme
    LDI r20, THEME
    LOAD r22, r20
    CMPI r26, 1
    JNZ r11, theme_dec
    ADDI r22, 1
    CMPI r22, 8
    BLT r11, theme_store
    LDI r22, 0
    JMP theme_store
theme_dec:
    JZ r22, theme_store     ; skip if already 0
    SUBI r22, 1
theme_store:
    STORE r20, r22
    JMP main_loop
not_theme:

    ; Cursor 1: volume (0-100)
    CMPI r23, 1
    JNZ r11, not_volume
    LDI r20, VOLUME
    LOAD r22, r20
    CMPI r26, 1
    JNZ r11, vol_dec
    ADDI r22, 10
    CMPI r22, 100
    BLT r11, vol_store
    LDI r22, 100
    JMP vol_store
vol_dec:
    JZ r22, vol_store
    SUBI r22, 10
vol_store:
    STORE r20, r22
    JMP main_loop
not_volume:

    ; Cursor 2: key repeat (1-5)
    LDI r20, KEYREPT
    LOAD r22, r20
    CMPI r26, 1
    JNZ r11, kr_dec
    ADDI r22, 1
    CMPI r22, 6
    BLT r11, kr_store
    LDI r22, 5
    JMP kr_store
kr_dec:
    CMPI r22, 2
    BLT r11, kr_store
    SUBI r22, 1
kr_store:
    STORE r20, r22
    JMP main_loop

key_done:
    JMP main_loop
