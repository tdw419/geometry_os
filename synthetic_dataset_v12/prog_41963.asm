; DESCRIPTION: Renders a red disk with center (464, 40) and radius 14.
; PLAN: r0=464(x), r1=40(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 40
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
