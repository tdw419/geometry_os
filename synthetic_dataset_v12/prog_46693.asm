; DESCRIPTION: Places a yellow circle of radius 54 at center (151, 95).
; PLAN: r0=151(x), r1=95(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 95
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
