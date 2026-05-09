; DESCRIPTION: Places a blue circle of radius 27 at center (82, 34).
; PLAN: r0=82(x), r1=34(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 34
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
