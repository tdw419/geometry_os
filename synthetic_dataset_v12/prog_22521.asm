; DESCRIPTION: Places a red circle of radius 13 at center (186, 182).
; PLAN: r0=186(x), r1=182(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 182
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
