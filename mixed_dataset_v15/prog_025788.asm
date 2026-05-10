; DESCRIPTION: Places a black circle of radius 65 at center (180, 145).
; PLAN: r0=180(x), r1=145(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 145
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
