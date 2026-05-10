; DESCRIPTION: Draws a white rectangle at (150, 3) with width 90 and height 116.
; PLAN: r0=150(x), r1=3(y), r2=90(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 3
LDI r2, 90
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
