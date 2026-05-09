; DESCRIPTION: Places a yellow circle of radius 18 at center (449, 113).
; PLAN: r0=449(x), r1=113(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 113
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
