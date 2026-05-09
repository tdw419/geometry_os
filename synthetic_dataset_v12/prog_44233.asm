; DESCRIPTION: Places a cyan 99x36 rectangle at position (127, 205).
; PLAN: r0=127(x), r1=205(y), r2=99(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 205
LDI r2, 99
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
