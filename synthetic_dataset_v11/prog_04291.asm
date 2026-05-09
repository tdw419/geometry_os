; DESCRIPTION: Places a purple circle of radius 77 at center (86, 146).
; PLAN: r0=86(x), r1=146(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 146
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
