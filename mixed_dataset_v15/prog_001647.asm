; DESCRIPTION: Places a cyan disk with center (54, 40) and radius 39.
; PLAN: r0=54(x), r1=40(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 40
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
