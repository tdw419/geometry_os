; DESCRIPTION: Draws a orange rectangle at (279, 101) with width 48 and height 33.
; PLAN: r0=279(x), r1=101(y), r2=48(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 101
LDI r2, 48
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
