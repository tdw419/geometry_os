; DESCRIPTION: Places a cyan disk with center (56, 200) and radius 56.
; PLAN: r0=56(x), r1=200(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 200
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
