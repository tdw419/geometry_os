; DESCRIPTION: Places a yellow disk with center (107, 187) and radius 79.
; PLAN: r0=107(x), r1=187(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 187
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
