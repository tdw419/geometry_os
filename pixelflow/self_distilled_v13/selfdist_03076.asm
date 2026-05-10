; DESCRIPTION: Places a cyan disk with center (169, 31) and radius 74.
; PLAN: r0=169(x), r1=31(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 31
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
