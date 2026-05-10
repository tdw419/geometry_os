; DESCRIPTION: Renders a black disk with center (411, 208) and radius 42.
; PLAN: r0=411(x), r1=208(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 208
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
