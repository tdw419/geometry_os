; DESCRIPTION: Renders a yellow disk with center (267, 154) and radius 16.
; PLAN: r0=267(x), r1=154(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 154
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
