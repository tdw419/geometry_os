; DESCRIPTION: Places a cyan disk with center (211, 155) and radius 27.
; PLAN: r0=211(x), r1=155(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 155
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
