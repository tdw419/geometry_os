; DESCRIPTION: Places a blue circle of radius 27 at center (150, 196).
; PLAN: r0=150(x), r1=196(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 196
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
