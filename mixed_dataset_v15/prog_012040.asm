; DESCRIPTION: Renders a blue circular shape at (303, 150) with radius 31.
; PLAN: r0=303(x), r1=150(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 150
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
