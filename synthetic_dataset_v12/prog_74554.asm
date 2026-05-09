; DESCRIPTION: Places a cyan circle of radius 12 at center (366, 223).
; PLAN: r0=366(x), r1=223(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 223
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
