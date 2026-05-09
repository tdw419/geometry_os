; DESCRIPTION: Renders a red disk with center (294, 106) and radius 73.
; PLAN: r0=294(x), r1=106(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 106
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
