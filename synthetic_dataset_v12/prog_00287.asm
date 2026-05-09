; DESCRIPTION: Places a red circle of radius 54 at center (288, 73).
; PLAN: r0=288(x), r1=73(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 73
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
