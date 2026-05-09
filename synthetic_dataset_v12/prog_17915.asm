; DESCRIPTION: Draws a black rectangle at (9, 120) with width 29 and height 56.
; PLAN: r0=9(x), r1=120(y), r2=29(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 120
LDI r2, 29
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
