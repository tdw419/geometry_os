; DESCRIPTION: Places a cyan disk with center (373, 16) and radius 80.
; PLAN: r0=373(x), r1=16(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 16
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
