; DESCRIPTION: Renders a orange disk with center (102, 202) and radius 11.
; PLAN: r0=102(x), r1=202(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 202
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
