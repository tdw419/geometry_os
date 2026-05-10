; DESCRIPTION: Places a blue circle of radius 65 at center (103, 93).
; PLAN: r0=103(x), r1=93(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 93
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
