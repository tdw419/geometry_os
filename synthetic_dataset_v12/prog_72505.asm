; DESCRIPTION: Renders a orange disk with center (392, 105) and radius 67.
; PLAN: r0=392(x), r1=105(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 105
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
