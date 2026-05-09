; DESCRIPTION: Renders a red disk with center (131, 146) and radius 61.
; PLAN: r0=131(x), r1=146(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 146
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
