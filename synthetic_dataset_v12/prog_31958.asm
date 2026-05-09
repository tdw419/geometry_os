; DESCRIPTION: Places a yellow circle of radius 63 at center (79, 178).
; PLAN: r0=79(x), r1=178(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 178
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
