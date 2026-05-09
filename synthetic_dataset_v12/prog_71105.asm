; DESCRIPTION: Renders a red disk with center (300, 113) and radius 70.
; PLAN: r0=300(x), r1=113(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 113
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
