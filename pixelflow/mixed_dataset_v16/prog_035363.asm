; DESCRIPTION: Renders a yellow circular shape at (150, 47) with radius 21.
; PLAN: r0=150(x), r1=47(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 47
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
