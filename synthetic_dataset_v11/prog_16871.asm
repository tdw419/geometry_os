; DESCRIPTION: Renders a red disk with center (95, 121) and radius 37.
; PLAN: r0=95(x), r1=121(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 121
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
