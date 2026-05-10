; DESCRIPTION: Renders a blue circular shape at (393, 111) with radius 77.
; PLAN: r0=393(x), r1=111(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 111
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
