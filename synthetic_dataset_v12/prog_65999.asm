; DESCRIPTION: Places a cyan circle of radius 25 at center (269, 34).
; PLAN: r0=269(x), r1=34(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 34
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
