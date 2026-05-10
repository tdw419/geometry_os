; DESCRIPTION: Draws a purple rectangle at (280, 146) with width 106 and height 79.
; PLAN: r0=280(x), r1=146(y), r2=106(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 146
LDI r2, 106
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
