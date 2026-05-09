; DESCRIPTION: Renders a black disk with center (46, 213) and radius 23.
; PLAN: r0=46(x), r1=213(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 46
LDI r1, 213
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
