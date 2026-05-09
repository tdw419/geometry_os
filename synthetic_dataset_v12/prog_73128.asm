; DESCRIPTION: Places a yellow circle of radius 42 at center (130, 44).
; PLAN: r0=130(x), r1=44(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 44
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
