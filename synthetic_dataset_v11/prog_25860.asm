; DESCRIPTION: Places a blue circle of radius 65 at center (71, 178).
; PLAN: r0=71(x), r1=178(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 178
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
