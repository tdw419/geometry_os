; DESCRIPTION: Places a yellow circle of radius 66 at center (152, 178).
; PLAN: r0=152(x), r1=178(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 178
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
