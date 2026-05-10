; DESCRIPTION: Places a cyan circle of radius 10 at center (463, 112).
; PLAN: r0=463(x), r1=112(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 112
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
