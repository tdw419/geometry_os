; DESCRIPTION: Renders a yellow disk with center (207, 202) and radius 47.
; PLAN: r0=207(x), r1=202(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 202
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
