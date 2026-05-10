; DESCRIPTION: Renders a cyan disk with center (443, 145) and radius 19.
; PLAN: r0=443(x), r1=145(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 145
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
