; DESCRIPTION: Renders a blue disk with center (173, 188) and radius 50.
; PLAN: r0=173(x), r1=188(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 188
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
