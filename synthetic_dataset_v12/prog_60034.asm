; DESCRIPTION: Renders a red disk with center (149, 73) and radius 32.
; PLAN: r0=149(x), r1=73(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 73
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
