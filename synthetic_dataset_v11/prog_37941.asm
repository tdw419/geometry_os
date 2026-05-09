; DESCRIPTION: Places a blue circle of radius 45 at center (179, 167).
; PLAN: r0=179(x), r1=167(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 167
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
