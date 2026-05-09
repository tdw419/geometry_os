; DESCRIPTION: Renders a orange disk with center (368, 220) and radius 17.
; PLAN: r0=368(x), r1=220(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 220
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
