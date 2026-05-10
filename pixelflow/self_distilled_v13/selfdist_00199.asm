; DESCRIPTION: Places a yellow disk with center (206, 55) and radius 74.
; PLAN: r0=206(x), r1=55(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 55
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
