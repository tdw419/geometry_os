; DESCRIPTION: Creates a cyan circular shape at (130, 111) with radius 80.
; PLAN: r0=130(x), r1=111(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 111
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
