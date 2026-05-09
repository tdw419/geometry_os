; DESCRIPTION: Renders a blue disk with center (106, 173) and radius 63.
; PLAN: r0=106(x), r1=173(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 173
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
