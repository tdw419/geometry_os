; DESCRIPTION: Composite: . Then Places a blue dot at position (86, 186). Then Places a orange line segment connecting (185, 94) to (12, 175).
; PLAN: r0=86(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=185(x1), r1=94(y1), r2=12(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (86, 186).
; PLAN: r0=86(x), r1=186(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 186
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (185, 94) to (12, 175).
; PLAN: r0=185(x1), r1=94(y1), r2=12(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 94
LDI r2, 12
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
