; DESCRIPTION: Renders a red disk with center (127, 233) and radius 10.
; PLAN: r0=127(x), r1=233(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 233
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
