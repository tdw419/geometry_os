; DESCRIPTION: Places a yellow circle of radius 42 at center (188, 92).
; PLAN: r0=188(x), r1=92(y), r2=42(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 92
LDI r2, 42
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
