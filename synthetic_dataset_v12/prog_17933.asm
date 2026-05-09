; DESCRIPTION: Places a red circle of radius 72 at center (433, 135).
; PLAN: r0=433(x), r1=135(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 433
LDI r1, 135
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
