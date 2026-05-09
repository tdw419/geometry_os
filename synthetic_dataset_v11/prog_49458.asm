; DESCRIPTION: Renders a cyan disk with center (134, 205) and radius 46.
; PLAN: r0=134(x), r1=205(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 205
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
