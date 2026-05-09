; DESCRIPTION: Renders a orange disk with center (350, 126) and radius 63.
; PLAN: r0=350(x), r1=126(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 126
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
