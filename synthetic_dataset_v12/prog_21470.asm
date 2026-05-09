; DESCRIPTION: Draws a yellow rectangle at (31, 33) with width 47 and height 77.
; PLAN: r0=31(x), r1=33(y), r2=47(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 33
LDI r2, 47
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
