; DESCRIPTION: Renders a blue disk with center (41, 168) and radius 36.
; PLAN: r0=41(x), r1=168(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 168
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
