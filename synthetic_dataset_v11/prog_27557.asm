; DESCRIPTION: Renders a orange disk with center (209, 64) and radius 25.
; PLAN: r0=209(x), r1=64(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 64
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
