; DESCRIPTION: Renders a yellow disk with center (121, 178) and radius 57.
; PLAN: r0=121(x), r1=178(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 178
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
