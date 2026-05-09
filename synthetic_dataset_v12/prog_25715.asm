; DESCRIPTION: Places a black circle of radius 70 at center (290, 143).
; PLAN: r0=290(x), r1=143(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 143
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
