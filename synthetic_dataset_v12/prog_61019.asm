; DESCRIPTION: Draws a orange rectangle at (21, 92) with width 75 and height 106.
; PLAN: r0=21(x), r1=92(y), r2=75(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 92
LDI r2, 75
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
