; DESCRIPTION: Places a white circle of radius 22 at center (455, 68).
; PLAN: r0=455(x), r1=68(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 68
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
