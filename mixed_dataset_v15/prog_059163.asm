; DESCRIPTION: Draws a yellow rectangle at (192, 16) with width 109 and height 115.
; PLAN: r0=192(x), r1=16(y), r2=109(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 16
LDI r2, 109
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
