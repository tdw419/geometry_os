; DESCRIPTION: Places a white circle of radius 66 at center (94, 146).
; PLAN: r0=94(x), r1=146(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 146
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
