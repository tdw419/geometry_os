; DESCRIPTION: Places a red circle of radius 72 at center (146, 130).
; PLAN: r0=146(x), r1=130(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 130
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
