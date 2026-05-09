; DESCRIPTION: Places a red circle of radius 70 at center (359, 89).
; PLAN: r0=359(x), r1=89(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 89
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
