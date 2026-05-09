; DESCRIPTION: Places a blue circle of radius 77 at center (179, 120).
; PLAN: r0=179(x), r1=120(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 120
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
