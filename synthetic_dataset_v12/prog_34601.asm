; DESCRIPTION: Places a red circle of radius 42 at center (288, 104).
; PLAN: r0=288(x), r1=104(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 104
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
