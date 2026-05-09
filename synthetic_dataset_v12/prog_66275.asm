; DESCRIPTION: Places a black circle of radius 22 at center (146, 222).
; PLAN: r0=146(x), r1=222(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 222
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
