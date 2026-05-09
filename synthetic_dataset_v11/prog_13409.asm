; DESCRIPTION: Draws a white rectangle at (169, 116) with width 25 and height 59.
; PLAN: r0=169(x), r1=116(y), r2=25(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 116
LDI r2, 25
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
