; DESCRIPTION: Places a black circle of radius 45 at center (357, 146).
; PLAN: r0=357(x), r1=146(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 146
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
