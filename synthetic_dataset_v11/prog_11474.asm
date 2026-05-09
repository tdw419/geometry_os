; DESCRIPTION: Places a yellow circle of radius 63 at center (165, 174).
; PLAN: r0=165(x), r1=174(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 174
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
