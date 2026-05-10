; DESCRIPTION: Creates a cyan circular shape at (400, 112) with radius 55.
; PLAN: r0=400(x), r1=112(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 112
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
