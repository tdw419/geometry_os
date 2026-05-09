; DESCRIPTION: Creates a cyan circular shape at (385, 111) with radius 31.
; PLAN: r0=385(x), r1=111(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 111
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
