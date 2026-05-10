; DESCRIPTION: Places a blue disk with center (246, 149) and radius 10.
; PLAN: r0=246(x), r1=149(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 149
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
