; DESCRIPTION: Renders a red disk with center (160, 166) and radius 54.
; PLAN: r0=160(x), r1=166(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 166
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
