; DESCRIPTION: Places a yellow circle of radius 36 at center (207, 113).
; PLAN: r0=207(x), r1=113(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 113
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
