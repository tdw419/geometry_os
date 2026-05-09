; DESCRIPTION: Places a blue circle of radius 27 at center (45, 95).
; PLAN: r0=45(x), r1=95(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 95
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
