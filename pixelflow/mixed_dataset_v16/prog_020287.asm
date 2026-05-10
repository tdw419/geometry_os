; DESCRIPTION: Places a red circle of radius 20 at center (179, 32).
; PLAN: r0=179(x), r1=32(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 32
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
