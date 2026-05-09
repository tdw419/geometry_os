; DESCRIPTION: Draws a white rectangle at (279, 100) with width 10 and height 90.
; PLAN: r0=279(x), r1=100(y), r2=10(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 100
LDI r2, 10
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
