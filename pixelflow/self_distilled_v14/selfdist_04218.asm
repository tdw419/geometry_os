; DESCRIPTION: Renders a cyan circular shape at (54, 89) with radius 40.
; PLAN: r0=54(x), r1=89(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 89
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
