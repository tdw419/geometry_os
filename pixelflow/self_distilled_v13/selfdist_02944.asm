; DESCRIPTION: Places a cyan disk with center (245, 62) and radius 19.
; PLAN: r0=245(x), r1=62(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 62
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
