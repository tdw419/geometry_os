; DESCRIPTION: Renders a yellow disk with center (70, 120) and radius 24.
; PLAN: r0=70(x), r1=120(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 120
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
