; DESCRIPTION: Renders a blue disk with center (128, 146) and radius 76.
; PLAN: r0=128(x), r1=146(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 146
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
