; DESCRIPTION: Draws a cyan circle centered at (249, 103) with radius 45.
; PLAN: r0=249(x), r1=103(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 103
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
