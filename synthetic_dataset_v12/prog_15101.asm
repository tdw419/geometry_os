; DESCRIPTION: Renders a cyan disk with center (169, 76) and radius 72.
; PLAN: r0=169(x), r1=76(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 76
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
