; DESCRIPTION: Creates a cyan circular shape at (474, 73) with radius 33.
; PLAN: r0=474(x), r1=73(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 474
LDI r1, 73
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
