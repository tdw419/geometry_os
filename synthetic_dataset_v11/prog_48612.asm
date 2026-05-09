; DESCRIPTION: Draws a red rectangle at (112, 181) with width 21 and height 35.
; PLAN: r0=112(x), r1=181(y), r2=21(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 181
LDI r2, 21
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
