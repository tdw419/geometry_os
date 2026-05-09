; DESCRIPTION: Draws a white rectangle at (145, 25) with width 92 and height 98.
; PLAN: r0=145(x), r1=25(y), r2=92(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 25
LDI r2, 92
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
