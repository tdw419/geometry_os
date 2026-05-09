; DESCRIPTION: Renders a red disk with center (122, 208) and radius 29.
; PLAN: r0=122(x), r1=208(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 208
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
