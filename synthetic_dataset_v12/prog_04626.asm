; DESCRIPTION: Renders a orange disk with center (298, 116) and radius 48.
; PLAN: r0=298(x), r1=116(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 116
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
