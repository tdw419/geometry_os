; DESCRIPTION: Draws a green rectangle at (116, 1) with width 34 and height 33.
; PLAN: r0=116(x), r1=1(y), r2=34(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 1
LDI r2, 34
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
