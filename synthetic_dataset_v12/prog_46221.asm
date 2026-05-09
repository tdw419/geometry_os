; DESCRIPTION: Draws a purple rectangle at (408, 146) with width 77 and height 77.
; PLAN: r0=408(x), r1=146(y), r2=77(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 146
LDI r2, 77
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
