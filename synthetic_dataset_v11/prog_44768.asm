; DESCRIPTION: Renders a orange disk with center (150, 154) and radius 12.
; PLAN: r0=150(x), r1=154(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 154
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
