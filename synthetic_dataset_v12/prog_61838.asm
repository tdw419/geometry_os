; DESCRIPTION: Draws a green rectangle at (199, 211) with width 44 and height 35.
; PLAN: r0=199(x), r1=211(y), r2=44(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 211
LDI r2, 44
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
