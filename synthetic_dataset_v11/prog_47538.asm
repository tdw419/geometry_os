; DESCRIPTION: Draws a yellow rectangle at (134, 75) with width 27 and height 83.
; PLAN: r0=134(x), r1=75(y), r2=27(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 75
LDI r2, 27
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
