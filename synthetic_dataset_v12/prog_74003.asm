; DESCRIPTION: Renders a orange disk with center (245, 146) and radius 67.
; PLAN: r0=245(x), r1=146(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 146
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
