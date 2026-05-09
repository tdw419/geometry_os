; DESCRIPTION: Places a red circle of radius 21 at center (186, 48).
; PLAN: r0=186(x), r1=48(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 48
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
