; DESCRIPTION: Renders a yellow disk with center (202, 62) and radius 27.
; PLAN: r0=202(x), r1=62(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 62
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
