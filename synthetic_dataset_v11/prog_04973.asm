; DESCRIPTION: Draws a red rectangle at (201, 17) with width 40 and height 56.
; PLAN: r0=201(x), r1=17(y), r2=40(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 17
LDI r2, 40
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
