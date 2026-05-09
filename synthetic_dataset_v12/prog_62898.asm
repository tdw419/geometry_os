; DESCRIPTION: Places a blue circle of radius 64 at center (168, 109).
; PLAN: r0=168(x), r1=109(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 109
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
