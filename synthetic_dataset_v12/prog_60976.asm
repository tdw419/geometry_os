; DESCRIPTION: Draws a white rectangle at (181, 25) with width 116 and height 50.
; PLAN: r0=181(x), r1=25(y), r2=116(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 25
LDI r2, 116
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
