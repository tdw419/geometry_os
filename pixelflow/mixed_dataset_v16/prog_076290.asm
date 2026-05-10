; DESCRIPTION: Places a yellow circle of radius 11 at center (445, 57).
; PLAN: r0=445(x), r1=57(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 57
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
