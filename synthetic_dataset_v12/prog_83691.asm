; DESCRIPTION: Draws a purple rectangle at (267, 137) with width 120 and height 23.
; PLAN: r0=267(x), r1=137(y), r2=120(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 137
LDI r2, 120
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
