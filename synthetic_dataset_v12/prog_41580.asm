; DESCRIPTION: Renders a magenta disk with center (278, 205) and radius 41.
; PLAN: r0=278(x), r1=205(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 205
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
