; DESCRIPTION: Renders a red disk with center (395, 73) and radius 51.
; PLAN: r0=395(x), r1=73(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 73
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
