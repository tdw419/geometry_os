; DESCRIPTION: Renders a blue circular shape at (146, 1) with radius 59.
; PLAN: r0=146(x), r1=1(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 1
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
