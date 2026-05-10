; DESCRIPTION: Draws a green rectangle at (367, 20) with width 116 and height 53.
; PLAN: r0=367(x), r1=20(y), r2=116(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 20
LDI r2, 116
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
