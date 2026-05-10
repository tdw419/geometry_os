; DESCRIPTION: Renders a orange disk with center (339, 198) and radius 40.
; PLAN: r0=339(x), r1=198(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 198
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
