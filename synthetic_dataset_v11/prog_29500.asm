; DESCRIPTION: Renders a purple disk with center (59, 113) and radius 55.
; PLAN: r0=59(x), r1=113(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 113
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
