; DESCRIPTION: Places a blue disk with center (308, 126) and radius 25.
; PLAN: r0=308(x), r1=126(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 126
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
