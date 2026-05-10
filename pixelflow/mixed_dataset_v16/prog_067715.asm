; DESCRIPTION: Places a yellow disk with center (346, 52) and radius 74.
; PLAN: r0=346(x), r1=52(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 52
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
