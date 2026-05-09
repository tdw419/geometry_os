; DESCRIPTION: Renders a red disk with center (280, 161) and radius 66.
; PLAN: r0=280(x), r1=161(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 161
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
