; DESCRIPTION: Places a cyan circle of radius 54 at center (385, 81).
; PLAN: r0=385(x), r1=81(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 81
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
