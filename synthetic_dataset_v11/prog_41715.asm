; DESCRIPTION: Renders a orange disk with center (29, 59) and radius 28.
; PLAN: r0=29(x), r1=59(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 29
LDI r1, 59
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
