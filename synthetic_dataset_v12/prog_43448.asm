; DESCRIPTION: Places a cyan circle of radius 49 at center (69, 58).
; PLAN: r0=69(x), r1=58(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 58
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
