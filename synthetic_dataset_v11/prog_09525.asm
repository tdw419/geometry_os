; DESCRIPTION: Places a purple circle of radius 79 at center (146, 92).
; PLAN: r0=146(x), r1=92(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 92
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
