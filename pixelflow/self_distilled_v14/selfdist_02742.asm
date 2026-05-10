; DESCRIPTION: Places a yellow disk with center (216, 66) and radius 42.
; PLAN: r0=216(x), r1=66(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 66
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
