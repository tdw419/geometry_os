; DESCRIPTION: Places a blue circle of radius 42 at center (435, 181).
; PLAN: r0=435(x), r1=181(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 181
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
