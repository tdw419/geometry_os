; DESCRIPTION: Places a red disk with center (364, 29) and radius 36.
; PLAN: r0=364(x), r1=29(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 29
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
