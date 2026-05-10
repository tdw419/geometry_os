; DESCRIPTION: Places a red disk with center (288, 43) and radius 34.
; PLAN: r0=288(x), r1=43(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 43
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
