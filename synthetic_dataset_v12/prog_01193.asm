; DESCRIPTION: Renders a red disk with center (160, 212) and radius 11.
; PLAN: r0=160(x), r1=212(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 212
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
