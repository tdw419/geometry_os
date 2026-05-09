; DESCRIPTION: Places a yellow circle of radius 35 at center (308, 38).
; PLAN: r0=308(x), r1=38(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 38
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
