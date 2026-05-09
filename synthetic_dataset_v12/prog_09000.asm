; DESCRIPTION: Places a yellow circle of radius 79 at center (412, 113).
; PLAN: r0=412(x), r1=113(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 113
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
