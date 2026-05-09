; DESCRIPTION: Draws a cyan circle centered at (183, 153) with radius 59.
; PLAN: r0=183(x), r1=153(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 153
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
