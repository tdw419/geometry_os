; DESCRIPTION: Renders a orange disk with center (313, 143) and radius 74.
; PLAN: r0=313(x), r1=143(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 143
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
