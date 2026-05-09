; DESCRIPTION: Renders a orange disk with center (126, 154) and radius 70.
; PLAN: r0=126(x), r1=154(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 154
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
