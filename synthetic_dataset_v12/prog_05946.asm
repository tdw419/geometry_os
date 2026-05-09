; DESCRIPTION: Renders a red disk with center (391, 95) and radius 49.
; PLAN: r0=391(x), r1=95(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 95
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
