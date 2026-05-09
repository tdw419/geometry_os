; DESCRIPTION: Draws a cyan circle centered at (101, 166) with radius 74.
; PLAN: r0=101(x), r1=166(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 166
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
