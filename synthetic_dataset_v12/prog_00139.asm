; DESCRIPTION: Renders a yellow disk with center (442, 98) and radius 68.
; PLAN: r0=442(x), r1=98(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 98
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
