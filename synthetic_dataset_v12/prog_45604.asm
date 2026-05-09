; DESCRIPTION: Renders a orange disk with center (408, 154) and radius 31.
; PLAN: r0=408(x), r1=154(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 154
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
