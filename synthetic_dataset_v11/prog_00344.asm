; DESCRIPTION: Renders a red disk with center (202, 82) and radius 51.
; PLAN: r0=202(x), r1=82(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 82
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
