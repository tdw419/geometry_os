; DESCRIPTION: Renders a orange disk with center (320, 197) and radius 53.
; PLAN: r0=320(x), r1=197(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 197
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
