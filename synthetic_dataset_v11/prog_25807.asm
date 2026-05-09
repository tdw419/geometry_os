; DESCRIPTION: Places a blue circle of radius 72 at center (168, 166).
; PLAN: r0=168(x), r1=166(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 166
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
