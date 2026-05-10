; DESCRIPTION: Places a blue circle of radius 26 at center (241, 173).
; PLAN: r0=241(x), r1=173(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 173
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
