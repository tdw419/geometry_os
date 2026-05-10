; DESCRIPTION: Renders a orange disk with center (70, 149) and radius 41.
; PLAN: r0=70(x), r1=149(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 149
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
