; DESCRIPTION: Renders a orange disk with center (473, 41) and radius 28.
; PLAN: r0=473(x), r1=41(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 41
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
