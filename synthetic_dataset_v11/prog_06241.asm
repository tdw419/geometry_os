; DESCRIPTION: Renders a blue disk with center (217, 173) and radius 35.
; PLAN: r0=217(x), r1=173(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 173
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
