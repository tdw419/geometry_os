; DESCRIPTION: Places a yellow circle of radius 34 at center (392, 98).
; PLAN: r0=392(x), r1=98(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 98
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
