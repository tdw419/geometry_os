; DESCRIPTION: Renders a blue disk with center (235, 224) and radius 28.
; PLAN: r0=235(x), r1=224(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 224
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
