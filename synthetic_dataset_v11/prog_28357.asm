; DESCRIPTION: Renders a black disk with center (182, 117) and radius 46.
; PLAN: r0=182(x), r1=117(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 117
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
