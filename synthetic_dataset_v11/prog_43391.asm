; DESCRIPTION: Draws a orange rectangle at (48, 97) with width 22 and height 92.
; PLAN: r0=48(x), r1=97(y), r2=22(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 97
LDI r2, 22
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
