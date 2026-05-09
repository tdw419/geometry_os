; DESCRIPTION: Draws a green rectangle at (52, 112) with width 95 and height 53.
; PLAN: r0=52(x), r1=112(y), r2=95(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 112
LDI r2, 95
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
