; DESCRIPTION: Places a cyan circle of radius 40 at center (206, 49).
; PLAN: r0=206(x), r1=49(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 49
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
