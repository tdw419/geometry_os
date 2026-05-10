; DESCRIPTION: Renders a orange disk with center (346, 95) and radius 65.
; PLAN: r0=346(x), r1=95(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 95
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
