; DESCRIPTION: Renders a yellow disk with center (146, 130) and radius 54.
; PLAN: r0=146(x), r1=130(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 130
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
