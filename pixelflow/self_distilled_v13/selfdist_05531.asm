; DESCRIPTION: Places a purple disk with center (206, 161) and radius 77.
; PLAN: r0=206(x), r1=161(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 161
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
