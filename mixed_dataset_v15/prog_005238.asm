; DESCRIPTION: Places a black circle of radius 65 at center (146, 142).
; PLAN: r0=146(x), r1=142(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 142
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
