; DESCRIPTION: Renders a cyan disk with center (106, 89) and radius 70.
; PLAN: r0=106(x), r1=89(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 89
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
