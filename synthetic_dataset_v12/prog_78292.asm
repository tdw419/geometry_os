; DESCRIPTION: Renders a cyan disk with center (260, 126) and radius 76.
; PLAN: r0=260(x), r1=126(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 126
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
