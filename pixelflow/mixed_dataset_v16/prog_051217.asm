; DESCRIPTION: Draws a purple rectangle at (217, 177) with width 82 and height 66.
; PLAN: r0=217(x), r1=177(y), r2=82(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 177
LDI r2, 82
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
