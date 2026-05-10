; DESCRIPTION: Renders a red disk with center (144, 154) and radius 10.
; PLAN: r0=144(x), r1=154(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 154
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
