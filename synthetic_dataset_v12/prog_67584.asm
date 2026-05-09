; DESCRIPTION: Draws a white rectangle at (300, 116) with width 72 and height 84.
; PLAN: r0=300(x), r1=116(y), r2=72(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 116
LDI r2, 72
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
