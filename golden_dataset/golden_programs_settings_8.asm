; DESCRIPTION: This GeOS assembly code implements a settings panel for theme selection, volume control, and configuration display. It uses RECTF to draw panels, DRAWTEXT for colored text rendering, and IKEY for input handling. The RAM layout manages the current theme ID, volume level, cursor position, key repeat speed, and a scratch buffer for text operations. The code supports navigation using W/S (up/down) to move the selection cursor and A/D/Enter to change settings values, with Escape exiting the panel.

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

    LOAD r3, r21           ; bg color
    ADDI r21, 1
    LOAD r16, r21           ; fg color
    ADDI r21, 1
    LOAD r17, r21           ; accent color
    ADDI r21, 1
    LOAD r18, r21           ; panel color

    ; Clear with bg
    FILL r3

    ; ── Title bar ──
    LDI r1, 0
    LDI r8, 0
    LDI r13, 256
    LDI r10, 24
    RECTF r1, r8, r13, r10, r17

    ; Title text
    LDI r20, SCRATCH
    STRO r20, "SETTINGS"
    LDI r1, 0
    LDI r8, 6
    LDI r13, SCRATCH
    LDI r10, 0             ; fg=black on accent
    LDI r6, 0
    DRAWTEXT r1, r8, r13, r10, r6

    ; ── Settings Panel ──
    ; Panel background
    LDI r1, 16
    LDI r8, 32
    LDI r13, 224
    LDI r10, 192
    RECTF r1, r8, r13, r10, r18

    ; Load cursor position
    LDI r20, CURSOR
    LOAD r23, r20

    ; ── Draw Theme option (row 0) ──
    LDI r1, 24
    LDI r8, 44
    CMPI r23, 0
    JNZ r11, not_sel0
    ; Highlight selected row
    LDI r1, 17
    LDI r8, 40
    LDI r13, 222
    LDI r10, 28
    RECTF r1, r8, r13, r10, r17
    LDI r1, 24
    LDI r8, 44
not_sel0:
    LDI r20, SCRATCH
    STRO r20, "Theme"
    LDI r1, 24
    LDI r8, 44
    LDI r13, SCRATCH
    DRAWTEXT r1, r8, r13, r16, r3

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
    LDI r1, 140
    LDI r8, 44
    LDI r13, SCRATCH
    ADDI r13, 10
    LDI r10, 0xFFAA00       ; gold for value
    DRAWTEXT r1, r8, r13, r10, r3

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
    LDI r1, 160
    LDI r8, 44
    LDI r13, SCRATCH
    ADDI r13, 20
    LDI r10, 0x808080
    DRAWTEXT r1, r8, r13, r10, r3

    ; ── Draw Volume option (row 1) ──
    LDI r1, 24
    LDI r8, 84
    CMPI r23, 1
    JNZ r11, not_sel1
    LDI r1, 17
    LDI r8, 80
    LDI r13, 222
    LDI r10, 28
    RECTF r1, r8, r13, r10, r17
    LDI r1, 24
    LDI r8, 84
not_sel1:
    LDI r20, SCRATCH
    STRO r20, "Volume"
    LDI r1, 24
    LDI r8, 84
    LDI r13, SCRATCH
    DRAWTEXT r1, r8, r13, r16, r3

    ; Volume bar
    LDI r20, VOLUME
    LOAD r22, r20
    ; Bar background
    LDI r1, 140
    LDI r8, 86
    LDI r13, 80
    LDI r10, 12
    LDI r6, 0x303030
    RECTF r1, r8, r13, r10, r6
    ; Bar fill (volume / 100 * 80)
    LDI r6, 80
    MUL r22, r6
    LDI r6, 100
    DIV r22, r6            ; fill_width = vol * 80 / 100
    LDI r1, 140
    LDI r8, 86
    LDI r10, 12
    RECTF r1, r8, r22, r10, r17

    ; Volume number
    LDI r20, VOLUME
    LOAD r22, r20
    LDI r20, SCRATCH
    ADDI r20, 30
    LDI r21, 48
    ; tens digit
    LDI r6, 10
    DIV r22, r6
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    ; ones digit
    LDI r21, 48
    LDI r22, VOLUME
    LOAD r22, r22
    LDI r6, 10
    MOD r22, r6
    ADD r21, r22
    STORE r20, r21
    ADDI r20, 1
    LDI r21, 0
    STORE r20, r21
    LDI r1, 226
    LDI r8, 84
    LDI r13, SCRATCH
    ADDI r13, 30
    LDI r10, 0xFFAA00
    DRAWTEXT r1, r8, r13, r10, r3

    ; ── Draw Key Repeat option (row 2) ──
    LDI r1, 24
    LDI r8, 124
    CMPI r23, 2
    JNZ r11, not_sel2
    LDI r1, 17
    LDI r8, 120
    LDI r13, 222
    LDI r10, 28
    RECTF r1, r8, r13, r10, r17
    LDI r1, 24
    LDI r8, 124
not_sel2:
    LDI r20, SCRATCH
    STRO r20, "Key Repeat"
    LDI r1, 24
    LDI r8, 124
    LDI r13, SCRATCH
    DRAWTEXT r1, r8, r13, r16, r3

    ; Key repeat dots (1-5)
    LDI r20, KEYREPT
    LOAD r22, r20
    ; Draw N filled dots
    LDI r1, 140
    LDI r8, 128
    LDI r6, 0
repeat_dots:
    CMP r6, r22
    BGE r11, dots_done
    LDI r13, 10
    LDI r10, 10
    RECTF r1, r8, r13, r10, r17
    ADDI r1, 14
    ADDI r6, 1
    JMP repeat_dots
dots_done:
    ; Draw (5-N) empty dots
    LDI r6, 0
empty_dots:
    CMP r6, r22
    BLT r11, skip_dot
    LDI r13, 10
    LDI r10, 10
    RECTF r1, r8, r13, r10, r6
    ; Use panel bg for empty dots
    RECTF r1, r8, r13, r10, r18
    ADDI r1, 14
skip_dot:
    ADDI r6, 1
    LDI r3, 5
    CMP r6, r3
    BLT r11, empty_dots

    ; Reload theme colors (r3-r18 were clobbered)
    LDI r20, THEME
    LOAD r22, r20
    SHLI r22, 2
    LDI r21, THEMES
    ADD r21, r22
    LOAD r3, r21
    ADDI r21, 1
    LOAD r16, r21
    ADDI r21, 1
    LOAD r17, r21
    ADDI r21, 1
    LOAD r18, r21

    ; ── Preview swatch ──
    LDI r1, 24
    LDI r8, 164
    LDI r13, 208
    LDI r10, 48
    RECTF r1, r8, r13, r10, r18

    ; Draw 4 small color swatches
    LDI r1, 32
    LDI r8, 170
    LDI r13, 40
    LDI r10, 36
    RECTF r1, r8, r13, r10, r3  ; bg
    ADDI r1, 48
    RECTF r1, r8, r13, r10, r16  ; fg
    ADDI r1, 48
    RECTF r1, r8, r13, r10, r17  ; accent
    ADDI r1, 48
    RECTF r1, r8, r13, r10, r18  ; panel

    ; Swatch labels
    LDI r20, SCRATCH
    STRO r20, "BG   FG   ACC  PAN"
    LDI r1, 32
    LDI r8, 210
    LDI r13, SCRATCH
    DRAWTEXT r1, r8, r13, r16, r3

    ; ── Help text at bottom ──
    LDI r1, 0
    LDI r8, 236
    LDI r13, 256
    LDI r10, 20
    RECTF r1, r8, r13, r10, r17
    LDI r20, SCRATCH
    STRO r20, "W/S Move  A/D Change  Esc Exit"
    LDI r1, 16
    LDI r8, 240
    LDI r13, SCRATCH
    LDI r10, 0             ; black on accent
    LDI r6, 0
    DRAWTEXT r1, r8, r13, r10, r6

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
