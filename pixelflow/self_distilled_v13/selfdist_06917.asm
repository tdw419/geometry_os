; DESCRIPTION: Draws a green rectangle at (182, 26) with width 17 and height 50.
; PLAN: r0=182(x), r1=26(y), r2=17(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 26
LDI r2, 17
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
