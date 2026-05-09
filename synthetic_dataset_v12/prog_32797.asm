; DESCRIPTION: Renders a orange disk with center (65, 36) and radius 14.
; PLAN: r0=65(x), r1=36(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 36
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
