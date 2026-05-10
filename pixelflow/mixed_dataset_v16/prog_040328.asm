; DESCRIPTION: Renders a orange disk with center (450, 103) and radius 52.
; PLAN: r0=450(x), r1=103(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 103
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
