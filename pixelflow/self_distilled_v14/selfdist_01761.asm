; DESCRIPTION: Places a red disk with center (115, 67) and radius 36.
; PLAN: r0=115(x), r1=67(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 67
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
