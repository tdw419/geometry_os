; DESCRIPTION: Places a yellow circle of radius 14 at center (33, 215).
; PLAN: r0=33(x), r1=215(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 215
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
