; DESCRIPTION: Renders a orange disk with center (392, 125) and radius 53.
; PLAN: r0=392(x), r1=125(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 125
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
