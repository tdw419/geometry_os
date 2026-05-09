; DESCRIPTION: Places a blue circle of radius 48 at center (412, 173).
; PLAN: r0=412(x), r1=173(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 173
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
