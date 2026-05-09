; DESCRIPTION: Creates a yellow circular shape at (79, 231) with radius 13.
; PLAN: r0=79(x), r1=231(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 231
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
