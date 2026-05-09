; DESCRIPTION: Places a yellow circle of radius 38 at center (207, 206).
; PLAN: r0=207(x), r1=206(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 206
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
