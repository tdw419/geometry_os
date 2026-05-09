; DESCRIPTION: Renders a green disk with center (365, 85) and radius 67.
; PLAN: r0=365(x), r1=85(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 85
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
