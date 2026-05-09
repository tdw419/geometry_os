; DESCRIPTION: Places a blue circle of radius 68 at center (168, 136).
; PLAN: r0=168(x), r1=136(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 136
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
