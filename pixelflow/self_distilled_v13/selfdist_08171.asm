; DESCRIPTION: Draws concentric yellow circles at the center with radii 20, 40, 60.
; PLAN: r0=30(x), r1=60(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 60
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
