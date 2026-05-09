; DESCRIPTION: Places a red circle of radius 46 at center (264, 66).
; PLAN: r0=264(x), r1=66(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 66
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
