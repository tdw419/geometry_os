; DESCRIPTION: Draws a cyan circle centered at (170, 153) with radius 20.
; PLAN: r0=170(x), r1=153(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 153
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
