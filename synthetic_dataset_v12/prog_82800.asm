; DESCRIPTION: Renders a orange disk with center (144, 173) and radius 40.
; PLAN: r0=144(x), r1=173(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 173
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
