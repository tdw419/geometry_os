; DESCRIPTION: Places a purple disk with center (52, 146) and radius 58.
; PLAN: r0=52(x), r1=146(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 146
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
