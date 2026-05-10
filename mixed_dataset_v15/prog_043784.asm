; DESCRIPTION: Draws a yellow rectangle at (116, 34) with width 74 and height 65.
; PLAN: r0=116(x), r1=34(y), r2=74(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 34
LDI r2, 74
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
