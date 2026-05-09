; DESCRIPTION: Places a cyan circle of radius 56 at center (112, 179).
; PLAN: r0=112(x), r1=179(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 179
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
