; DESCRIPTION: Places a green 98x84 rectangle at position (205, 3).
; PLAN: r0=205(x), r1=3(y), r2=98(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 3
LDI r2, 98
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
