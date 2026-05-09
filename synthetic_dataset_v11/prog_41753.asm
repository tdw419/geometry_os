; DESCRIPTION: Renders a red disk with center (170, 164) and radius 58.
; PLAN: r0=170(x), r1=164(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 164
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
