; DESCRIPTION: Draws a white rectangle at (48, 132) with width 116 and height 56.
; PLAN: r0=48(x), r1=132(y), r2=116(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 132
LDI r2, 116
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
