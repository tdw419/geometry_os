; DESCRIPTION: Renders a orange disk with center (408, 39) and radius 39.
; PLAN: r0=408(x), r1=39(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 39
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
