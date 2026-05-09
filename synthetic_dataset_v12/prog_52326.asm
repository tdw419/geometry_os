; DESCRIPTION: Places a red circle of radius 68 at center (205, 142).
; PLAN: r0=205(x), r1=142(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 142
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
