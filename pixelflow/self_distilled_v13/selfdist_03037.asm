; DESCRIPTION: Places a red disk with center (28, 54) and radius 33.
; PLAN: r0=28(x), r1=54(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 54
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
