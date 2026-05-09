; DESCRIPTION: Composite: . Then Places a orange line segment connecting (172, 164) to (7, 168). Then Places a blue dot at position (197, 148).
; PLAN: r0=172(x1), r1=164(y1), r2=7(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=197(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (172, 164) to (7, 168).
; PLAN: r0=172(x1), r1=164(y1), r2=7(x2), r3=168(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 164
LDI r2, 7
LDI r3, 168
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (197, 148).
; PLAN: r0=197(x), r1=148(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 197
LDI r1, 148
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
