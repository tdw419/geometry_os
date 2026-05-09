; DESCRIPTION: Draws a white rectangle at (107, 79) with width 29 and height 36.
; PLAN: r0=107(x), r1=79(y), r2=29(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 79
LDI r2, 29
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
