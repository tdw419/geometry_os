; DESCRIPTION: Draws a green rectangle at (32, 46) with width 87 and height 106.
; PLAN: r0=32(x), r1=46(y), r2=87(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 46
LDI r2, 87
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
