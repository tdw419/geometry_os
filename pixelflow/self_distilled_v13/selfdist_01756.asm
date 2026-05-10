; DESCRIPTION: Places a purple disk with center (180, 162) and radius 47.
; PLAN: r0=180(x), r1=162(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 162
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
