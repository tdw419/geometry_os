; DESCRIPTION: Places a yellow circle of radius 22 at center (154, 207).
; PLAN: r0=154(x), r1=207(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 207
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
