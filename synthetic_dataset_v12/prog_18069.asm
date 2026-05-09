; DESCRIPTION: Draws a cyan circle centered at (420, 100) with radius 55.
; PLAN: r0=420(x), r1=100(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 100
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
