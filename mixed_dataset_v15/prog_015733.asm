; DESCRIPTION: Renders a orange disk with center (220, 116) and radius 47.
; PLAN: r0=220(x), r1=116(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 116
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
