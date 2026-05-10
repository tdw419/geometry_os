; DESCRIPTION: Renders a yellow disk with center (213, 137) and radius 42.
; PLAN: r0=213(x), r1=137(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 137
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
