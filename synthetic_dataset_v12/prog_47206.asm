; DESCRIPTION: Renders a orange disk with center (153, 111) and radius 39.
; PLAN: r0=153(x), r1=111(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 111
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
