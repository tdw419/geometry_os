; DESCRIPTION: Draws a orange rectangle at (112, 118) with width 111 and height 99.
; PLAN: r0=112(x), r1=118(y), r2=111(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 118
LDI r2, 111
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
