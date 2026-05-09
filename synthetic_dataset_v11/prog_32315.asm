; DESCRIPTION: Places a green circle of radius 61 at center (161, 187).
; PLAN: r0=161(x), r1=187(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 187
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
