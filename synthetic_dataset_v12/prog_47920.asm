; DESCRIPTION: Renders a cyan disk with center (374, 114) and radius 76.
; PLAN: r0=374(x), r1=114(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 114
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
