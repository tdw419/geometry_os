; DESCRIPTION: Renders a green disk with center (371, 203) and radius 42.
; PLAN: r0=371(x), r1=203(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 203
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
