; DESCRIPTION: Draws a black rectangle at (280, 145) with width 14 and height 10.
; PLAN: r0=280(x), r1=145(y), r2=14(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 145
LDI r2, 14
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
