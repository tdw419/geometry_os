; DESCRIPTION: Draws a white rectangle at (413, 63) with width 79 and height 97.
; PLAN: r0=413(x), r1=63(y), r2=79(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 63
LDI r2, 79
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
