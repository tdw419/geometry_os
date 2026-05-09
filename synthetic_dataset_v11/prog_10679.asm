; DESCRIPTION: Renders a black disk with center (146, 127) and radius 67.
; PLAN: r0=146(x), r1=127(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 127
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
