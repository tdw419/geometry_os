; DESCRIPTION: Renders a cyan disk with center (205, 69) and radius 26.
; PLAN: r0=205(x), r1=69(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 69
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
