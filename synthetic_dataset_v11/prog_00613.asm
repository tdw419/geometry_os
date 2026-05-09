; DESCRIPTION: Draws a cyan circle centered at (221, 204) with radius 14.
; PLAN: r0=221(x), r1=204(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 204
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
