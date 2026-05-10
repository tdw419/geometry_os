; DESCRIPTION: Draws concentric blue circles at the center with radii 20, 40, 60.
; PLAN: r0=35(x), r1=40(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 35
LDI r1, 40
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
