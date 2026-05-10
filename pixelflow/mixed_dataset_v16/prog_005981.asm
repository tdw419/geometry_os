; DESCRIPTION: Renders a orange disk with center (452, 146) and radius 47.
; PLAN: r0=452(x), r1=146(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 146
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
