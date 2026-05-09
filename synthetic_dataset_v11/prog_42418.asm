; DESCRIPTION: Places a cyan circle of radius 54 at center (132, 73).
; PLAN: r0=132(x), r1=73(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 73
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
