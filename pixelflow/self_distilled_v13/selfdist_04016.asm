; DESCRIPTION: Places a cyan disk with center (227, 152) and radius 11.
; PLAN: r0=227(x), r1=152(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 152
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
