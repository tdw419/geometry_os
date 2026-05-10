; DESCRIPTION: Draws a yellow rectangle at (199, 68) with width 31 and height 61.
; PLAN: r0=199(x), r1=68(y), r2=31(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 68
LDI r2, 31
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
