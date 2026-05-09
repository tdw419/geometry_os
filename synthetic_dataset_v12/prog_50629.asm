; DESCRIPTION: Draws a yellow rectangle at (286, 50) with width 56 and height 33.
; PLAN: r0=286(x), r1=50(y), r2=56(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 50
LDI r2, 56
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
