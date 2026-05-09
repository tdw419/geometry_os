; DESCRIPTION: Places a yellow circle of radius 13 at center (95, 126).
; PLAN: r0=95(x), r1=126(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 126
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
