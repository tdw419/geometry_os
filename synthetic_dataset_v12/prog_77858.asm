; DESCRIPTION: Creates a cyan circular shape at (415, 184) with radius 19.
; PLAN: r0=415(x), r1=184(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 184
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
