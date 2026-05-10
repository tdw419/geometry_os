; DESCRIPTION: Places a green circle of radius 20 at center (187, 84).
; PLAN: r0=187(x), r1=84(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 84
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
