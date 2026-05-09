; DESCRIPTION: Composite: . Then Places a orange line segment connecting (74, 165) to (53, 133). Then Places a blue dot at position (15, 161).
; PLAN: r0=74(x1), r1=165(y1), r2=53(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=15(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (74, 165) to (53, 133).
; PLAN: r0=74(x1), r1=165(y1), r2=53(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 165
LDI r2, 53
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (15, 161).
; PLAN: r0=15(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
