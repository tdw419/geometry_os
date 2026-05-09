; DESCRIPTION: Places a cyan circle of radius 71 at center (253, 90).
; PLAN: r0=253(x), r1=90(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 90
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
