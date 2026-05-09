; DESCRIPTION: Renders a orange disk with center (90, 161) and radius 57.
; PLAN: r0=90(x), r1=161(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 161
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
