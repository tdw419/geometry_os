; DESCRIPTION: Places a yellow circle of radius 23 at center (392, 90).
; PLAN: r0=392(x), r1=90(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 90
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
