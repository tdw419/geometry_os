; DESCRIPTION: Places a yellow circle of radius 36 at center (281, 82).
; PLAN: r0=281(x), r1=82(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 82
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
