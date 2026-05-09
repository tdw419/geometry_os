; DESCRIPTION: Draws a red rectangle at (110, 219) with width 14 and height 25.
; PLAN: r0=110(x), r1=219(y), r2=14(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 219
LDI r2, 14
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
