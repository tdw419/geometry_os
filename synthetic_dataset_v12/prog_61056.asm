; DESCRIPTION: Draws a black rectangle at (350, 120) with width 114 and height 115.
; PLAN: r0=350(x), r1=120(y), r2=114(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 120
LDI r2, 114
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
