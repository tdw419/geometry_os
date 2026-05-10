; DESCRIPTION: Places a cyan disk with center (207, 34) and radius 47.
; PLAN: r0=207(x), r1=34(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 34
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
