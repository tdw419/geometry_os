; DESCRIPTION: Places a cyan disk with center (278, 120) and radius 11.
; PLAN: r0=278(x), r1=120(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 120
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
