; DESCRIPTION: Renders a red disk with center (305, 179) and radius 23.
; PLAN: r0=305(x), r1=179(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 179
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
