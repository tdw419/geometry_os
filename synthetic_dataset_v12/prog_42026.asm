; DESCRIPTION: Renders a purple disk with center (443, 57) and radius 54.
; PLAN: r0=443(x), r1=57(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 57
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
