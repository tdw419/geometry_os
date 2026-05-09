; DESCRIPTION: Renders a red disk with center (177, 111) and radius 61.
; PLAN: r0=177(x), r1=111(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 111
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
