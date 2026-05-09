; DESCRIPTION: Renders a purple disk with center (443, 171) and radius 68.
; PLAN: r0=443(x), r1=171(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 171
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
