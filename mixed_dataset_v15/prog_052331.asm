; DESCRIPTION: Renders a cyan circular shape at (35, 10) with radius 80.
; PLAN: r0=35(x), r1=10(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 10
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
