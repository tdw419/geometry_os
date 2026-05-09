; DESCRIPTION: Draws a orange rectangle at (192, 20) with width 93 and height 20.
; PLAN: r0=192(x), r1=20(y), r2=93(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 20
LDI r2, 93
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
