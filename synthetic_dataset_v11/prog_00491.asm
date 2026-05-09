; DESCRIPTION: Renders a yellow disk with center (146, 53) and radius 36.
; PLAN: r0=146(x), r1=53(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 53
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
