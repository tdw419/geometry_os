; DESCRIPTION: Draws a orange rectangle at (135, 200) with width 48 and height 43.
; PLAN: r0=135(x), r1=200(y), r2=48(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 200
LDI r2, 48
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
