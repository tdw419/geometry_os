; DESCRIPTION: Places a red circle of radius 68 at center (266, 169).
; PLAN: r0=266(x), r1=169(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 169
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
