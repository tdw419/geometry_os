; DESCRIPTION: Composite: . Then Places a white line segment connecting (53, 243) to (160, 229). Then Places a red circle of radius 29 at center (128, 116).
; PLAN: r0=53(x1), r1=243(y1), r2=160(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=116(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (53, 243) to (160, 229).
; PLAN: r0=53(x1), r1=243(y1), r2=160(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 243
LDI r2, 160
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 29 at center (128, 116).
; PLAN: r0=128(x), r1=116(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 116
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
