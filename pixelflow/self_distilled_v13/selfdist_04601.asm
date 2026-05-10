; DESCRIPTION: Renders a yellow circular shape at (355, 50) with radius 44.
; PLAN: r0=355(x), r1=50(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 50
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
