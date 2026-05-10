; DESCRIPTION: Draws a yellow rectangle at (219, 120) with width 109 and height 118.
; PLAN: r0=219(x), r1=120(y), r2=109(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 120
LDI r2, 109
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
