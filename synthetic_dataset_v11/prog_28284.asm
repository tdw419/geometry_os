; DESCRIPTION: Places a yellow circle of radius 70 at center (79, 91).
; PLAN: r0=79(x), r1=91(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 91
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
