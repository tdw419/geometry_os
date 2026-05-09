; DESCRIPTION: Renders a red disk with center (160, 185) and radius 68.
; PLAN: r0=160(x), r1=185(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 185
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
