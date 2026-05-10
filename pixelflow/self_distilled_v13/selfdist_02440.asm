; DESCRIPTION: Renders a cyan circular shape at (94, 33) with radius 55.
; PLAN: r0=94(x), r1=33(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 33
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
