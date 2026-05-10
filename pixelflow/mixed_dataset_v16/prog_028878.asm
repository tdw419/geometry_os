; DESCRIPTION: Draws a yellow rectangle at (212, 120) with width 43 and height 30.
; PLAN: r0=212(x), r1=120(y), r2=43(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 120
LDI r2, 43
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
