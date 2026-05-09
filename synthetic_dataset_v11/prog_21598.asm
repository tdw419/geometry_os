; DESCRIPTION: Places a red circle of radius 54 at center (71, 200).
; PLAN: r0=71(x), r1=200(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 200
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
