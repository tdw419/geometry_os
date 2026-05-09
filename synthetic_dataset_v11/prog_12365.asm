; DESCRIPTION: Renders a orange disk with center (157, 68) and radius 32.
; PLAN: r0=157(x), r1=68(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 68
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
