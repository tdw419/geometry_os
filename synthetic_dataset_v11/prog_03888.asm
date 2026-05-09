; DESCRIPTION: Renders a yellow disk with center (144, 146) and radius 56.
; PLAN: r0=144(x), r1=146(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 146
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
