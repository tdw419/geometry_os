; DESCRIPTION: Renders a yellow disk with center (126, 150) and radius 60.
; PLAN: r0=126(x), r1=150(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 150
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
