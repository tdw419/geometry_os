; DESCRIPTION: Places a purple circle of radius 47 at center (70, 146).
; PLAN: r0=70(x), r1=146(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 146
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
