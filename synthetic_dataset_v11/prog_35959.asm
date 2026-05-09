; DESCRIPTION: Draws a white rectangle at (112, 82) with width 72 and height 118.
; PLAN: r0=112(x), r1=82(y), r2=72(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 82
LDI r2, 72
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
