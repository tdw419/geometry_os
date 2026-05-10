; DESCRIPTION: Renders a red circular shape at (220, 140) with radius 52.
; PLAN: r0=220(x), r1=140(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 140
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
