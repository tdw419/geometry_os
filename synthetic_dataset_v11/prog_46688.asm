; DESCRIPTION: Draws a white rectangle at (50, 137) with width 17 and height 102.
; PLAN: r0=50(x), r1=137(y), r2=17(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 137
LDI r2, 17
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
