; DESCRIPTION: Places a blue circle of radius 47 at center (317, 195).
; PLAN: r0=317(x), r1=195(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 195
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
