; DESCRIPTION: Renders a blue disk with center (338, 173) and radius 65.
; PLAN: r0=338(x), r1=173(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 173
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
