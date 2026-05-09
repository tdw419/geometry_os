; DESCRIPTION: Draws a white rectangle at (157, 112) with width 116 and height 19.
; PLAN: r0=157(x), r1=112(y), r2=116(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 112
LDI r2, 116
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
