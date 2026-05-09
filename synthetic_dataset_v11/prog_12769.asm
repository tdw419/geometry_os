; DESCRIPTION: Places a yellow circle of radius 57 at center (66, 113).
; PLAN: r0=66(x), r1=113(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 113
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
