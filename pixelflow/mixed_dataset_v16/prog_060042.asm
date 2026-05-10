; DESCRIPTION: Renders a red disk with center (152, 65) and radius 13.
; PLAN: r0=152(x), r1=65(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 65
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
