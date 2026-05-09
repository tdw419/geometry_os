; DESCRIPTION: Places a cyan circle of radius 58 at center (191, 81).
; PLAN: r0=191(x), r1=81(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 81
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
