; DESCRIPTION: Draws a white rectangle at (259, 132) with width 109 and height 87.
; PLAN: r0=259(x), r1=132(y), r2=109(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 132
LDI r2, 109
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
