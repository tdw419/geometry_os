; DESCRIPTION: Renders a yellow disk with center (239, 91) and radius 71.
; PLAN: r0=239(x), r1=91(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 91
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
