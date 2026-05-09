; DESCRIPTION: Renders a yellow disk with center (198, 129) and radius 27.
; PLAN: r0=198(x), r1=129(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 129
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
