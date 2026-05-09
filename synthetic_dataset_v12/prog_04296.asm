; DESCRIPTION: Places a black circle of radius 65 at center (273, 186).
; PLAN: r0=273(x), r1=186(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 186
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
