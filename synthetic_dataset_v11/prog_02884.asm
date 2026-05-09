; DESCRIPTION: Places a blue circle of radius 38 at center (217, 107).
; PLAN: r0=217(x), r1=107(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 107
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
