; DESCRIPTION: Places a red circle of radius 16 at center (176, 35).
; PLAN: r0=176(x), r1=35(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 35
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
