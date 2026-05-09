; DESCRIPTION: Draws a yellow rectangle at (89, 157) with width 61 and height 71.
; PLAN: r0=89(x), r1=157(y), r2=61(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 157
LDI r2, 61
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
