; DESCRIPTION: Places a purple circle of radius 65 at center (180, 141).
; PLAN: r0=180(x), r1=141(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 141
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
