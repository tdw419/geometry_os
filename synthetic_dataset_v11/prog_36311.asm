; DESCRIPTION: Draws a white rectangle at (79, 1) with width 87 and height 95.
; PLAN: r0=79(x), r1=1(y), r2=87(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 1
LDI r2, 87
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
