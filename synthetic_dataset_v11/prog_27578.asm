; DESCRIPTION: Renders a red disk with center (120, 178) and radius 77.
; PLAN: r0=120(x), r1=178(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 178
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
