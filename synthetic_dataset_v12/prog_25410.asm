; DESCRIPTION: Places a blue circle of radius 66 at center (428, 146).
; PLAN: r0=428(x), r1=146(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 146
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
