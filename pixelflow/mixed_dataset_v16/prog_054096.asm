; DESCRIPTION: Places a red circle of radius 16 at center (17, 133).
; PLAN: r0=17(x), r1=133(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 133
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
