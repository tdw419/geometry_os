; DESCRIPTION: Places a green circle of radius 26 at center (430, 187).
; PLAN: r0=430(x), r1=187(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 187
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
