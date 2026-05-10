; DESCRIPTION: Renders a cyan circular shape at (26, 54) with radius 70.
; PLAN: r0=26(x), r1=54(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 54
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
