; DESCRIPTION: Renders a orange disk with center (220, 120) and radius 75.
; PLAN: r0=220(x), r1=120(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 120
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
