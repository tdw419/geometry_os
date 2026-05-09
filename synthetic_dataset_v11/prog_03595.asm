; DESCRIPTION: Places a yellow circle of radius 47 at center (174, 209).
; PLAN: r0=174(x), r1=209(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 209
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
