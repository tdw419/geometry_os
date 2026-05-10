; DESCRIPTION: Places a cyan disk with center (161, 179) and radius 30.
; PLAN: r0=161(x), r1=179(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 179
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
