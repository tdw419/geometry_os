; DESCRIPTION: Places a cyan circle of radius 64 at center (153, 112).
; PLAN: r0=153(x), r1=112(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 112
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
