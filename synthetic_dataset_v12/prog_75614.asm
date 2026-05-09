; DESCRIPTION: Renders a red disk with center (113, 84) and radius 34.
; PLAN: r0=113(x), r1=84(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 84
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
