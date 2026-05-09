; DESCRIPTION: Renders a cyan disk with center (102, 155) and radius 79.
; PLAN: r0=102(x), r1=155(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 155
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
