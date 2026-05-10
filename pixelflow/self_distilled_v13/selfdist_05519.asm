; DESCRIPTION: Renders a blue circular shape at (386, 57) with radius 50.
; PLAN: r0=386(x), r1=57(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 57
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
