; DESCRIPTION: Draws a green rectangle at (71, 195) with width 112 and height 55.
; PLAN: r0=71(x), r1=195(y), r2=112(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 195
LDI r2, 112
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
