; DESCRIPTION: Renders a orange disk with center (420, 146) and radius 20.
; PLAN: r0=420(x), r1=146(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 146
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
