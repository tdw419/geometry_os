; DESCRIPTION: Places a red circle of radius 29 at center (176, 138).
; PLAN: r0=176(x), r1=138(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 138
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
