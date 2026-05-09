; DESCRIPTION: Renders a yellow disk with center (186, 150) and radius 16.
; PLAN: r0=186(x), r1=150(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 150
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
