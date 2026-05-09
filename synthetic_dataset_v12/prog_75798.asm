; DESCRIPTION: Places a yellow circle of radius 48 at center (206, 153).
; PLAN: r0=206(x), r1=153(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 153
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
