; DESCRIPTION: Places a white circle of radius 40 at center (58, 127).
; PLAN: r0=58(x), r1=127(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 127
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
