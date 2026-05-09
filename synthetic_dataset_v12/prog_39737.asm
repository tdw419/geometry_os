; DESCRIPTION: Renders a orange disk with center (172, 187) and radius 39.
; PLAN: r0=172(x), r1=187(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 187
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
