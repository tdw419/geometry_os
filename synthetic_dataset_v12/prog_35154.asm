; DESCRIPTION: Places a yellow circle of radius 25 at center (374, 126).
; PLAN: r0=374(x), r1=126(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 126
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
