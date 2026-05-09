; DESCRIPTION: Draws a yellow rectangle at (177, 33) with width 18 and height 80.
; PLAN: r0=177(x), r1=33(y), r2=18(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 33
LDI r2, 18
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
