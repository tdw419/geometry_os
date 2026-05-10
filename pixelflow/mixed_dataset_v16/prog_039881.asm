; DESCRIPTION: Places a cyan disk with center (273, 87) and radius 10.
; PLAN: r0=273(x), r1=87(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 87
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
