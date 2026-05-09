; DESCRIPTION: Places a cyan circle of radius 50 at center (142, 179).
; PLAN: r0=142(x), r1=179(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 179
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
