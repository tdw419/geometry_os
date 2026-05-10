; DESCRIPTION: Renders a orange disk with center (113, 117) and radius 45.
; PLAN: r0=113(x), r1=117(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 117
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
