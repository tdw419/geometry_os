; DESCRIPTION: Renders a cyan disk with center (102, 161) and radius 76.
; PLAN: r0=102(x), r1=161(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 161
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
