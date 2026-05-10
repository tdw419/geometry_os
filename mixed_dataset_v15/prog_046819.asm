; DESCRIPTION: Renders a orange disk with center (74, 153) and radius 48.
; PLAN: r0=74(x), r1=153(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 153
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
