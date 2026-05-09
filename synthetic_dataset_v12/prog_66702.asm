; DESCRIPTION: Places a red circle of radius 73 at center (331, 174).
; PLAN: r0=331(x), r1=174(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 174
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
