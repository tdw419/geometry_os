; DESCRIPTION: Draws a yellow rectangle at (34, 189) with width 33 and height 57.
; PLAN: r0=34(x), r1=189(y), r2=33(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 189
LDI r2, 33
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
