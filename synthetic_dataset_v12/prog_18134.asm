; DESCRIPTION: Renders a orange disk with center (154, 80) and radius 25.
; PLAN: r0=154(x), r1=80(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 80
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
