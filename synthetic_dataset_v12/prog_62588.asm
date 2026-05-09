; DESCRIPTION: Places a purple circle of radius 21 at center (398, 91).
; PLAN: r0=398(x), r1=91(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 398
LDI r1, 91
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
