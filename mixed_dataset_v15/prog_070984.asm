; DESCRIPTION: Draws a white rectangle at (228, 147) with width 112 and height 79.
; PLAN: r0=228(x), r1=147(y), r2=112(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 147
LDI r2, 112
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
