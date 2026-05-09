; DESCRIPTION: Renders a cyan disk with center (169, 102) and radius 80.
; PLAN: r0=169(x), r1=102(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 102
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
