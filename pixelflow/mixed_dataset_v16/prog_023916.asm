; DESCRIPTION: Renders a blue disk with center (429, 152) and radius 59.
; PLAN: r0=429(x), r1=152(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 152
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
