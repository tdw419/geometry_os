; DESCRIPTION: Places a cyan circle of radius 80 at center (133, 143).
; PLAN: r0=133(x), r1=143(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 143
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
