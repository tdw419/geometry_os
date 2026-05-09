; DESCRIPTION: Draws a orange rectangle at (163, 48) with width 73 and height 100.
; PLAN: r0=163(x), r1=48(y), r2=73(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 48
LDI r2, 73
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
