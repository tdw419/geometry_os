; DESCRIPTION: Draws a black rectangle at (199, 214) with width 44 and height 15.
; PLAN: r0=199(x), r1=214(y), r2=44(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 214
LDI r2, 44
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
