; DESCRIPTION: Renders a cyan circular shape at (30, 87) with radius 20.
; PLAN: r0=30(x), r1=87(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 87
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
