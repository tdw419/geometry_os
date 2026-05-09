; DESCRIPTION: Renders a red disk with center (106, 149) and radius 48.
; PLAN: r0=106(x), r1=149(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 149
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
