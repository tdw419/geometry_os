; DESCRIPTION: Draws a purple rectangle at (73, 146) with width 103 and height 51.
; PLAN: r0=73(x), r1=146(y), r2=103(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 146
LDI r2, 103
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
