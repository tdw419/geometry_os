; DESCRIPTION: Draws a cyan circle centered at (81, 196) with radius 53.
; PLAN: r0=81(x), r1=196(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 196
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
