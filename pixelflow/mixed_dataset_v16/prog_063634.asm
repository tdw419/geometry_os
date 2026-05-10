; DESCRIPTION: Places a cyan disk with center (56, 131) and radius 21.
; PLAN: r0=56(x), r1=131(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 131
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
