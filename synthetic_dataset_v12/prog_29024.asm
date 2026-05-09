; DESCRIPTION: Places a blue circle of radius 72 at center (346, 107).
; PLAN: r0=346(x), r1=107(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 107
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
