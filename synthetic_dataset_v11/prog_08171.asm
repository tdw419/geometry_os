; DESCRIPTION: Renders a orange disk with center (95, 186) and radius 13.
; PLAN: r0=95(x), r1=186(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 186
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
