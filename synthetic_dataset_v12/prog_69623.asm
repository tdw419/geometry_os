; DESCRIPTION: Renders a black disk with center (70, 146) and radius 43.
; PLAN: r0=70(x), r1=146(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 146
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
