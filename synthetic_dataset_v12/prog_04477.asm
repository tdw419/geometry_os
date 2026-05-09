; DESCRIPTION: Places a purple circle of radius 40 at center (108, 91).
; PLAN: r0=108(x), r1=91(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 91
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
