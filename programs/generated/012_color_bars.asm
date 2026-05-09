; COLOR BARS -- Classic TV test pattern, 8 vertical bars across 256px screen
; Each bar is 32 pixels wide, full height, different color
; Colors: white, yellow, cyan, green, magenta, red, blue, black

; Bar 1: White (0xFFFFFF) at x=0
LDI r0, 0
LDI r1, 0
LDI r2, 32
LDI r3, 256
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4

; Bar 2: Yellow (0xFFFF00) at x=32
LDI r0, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

; Bar 3: Cyan (0x00FFFF) at x=64
LDI r0, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4

; Bar 4: Green (0x00FF00) at x=96
LDI r0, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4

; Bar 5: Magenta (0xFF00FF) at x=128
LDI r0, 128
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

; Bar 6: Red (0xFF0000) at x=160
LDI r0, 160
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

; Bar 7: Blue (0x0000FF) at x=192
LDI r0, 192
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4

; Bar 8: Black (0x000000) at x=224
LDI r0, 224
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4

HALT
