; DESCRIPTION: Draws a green rectangle at (102, 116) with width 86 and height 84.
; PLAN: r0=102(x), r1=116(y), r2=86(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 116
LDI r2, 86
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
