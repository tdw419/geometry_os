; DESCRIPTION: Composite: . Then Places a orange circle of radius 80 at center (146, 107). Then Places a purple dot at position (132, 162).
; PLAN: r0=146(x), r1=107(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 80 at center (146, 107).
; PLAN: r0=146(x), r1=107(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 107
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (132, 162).
; PLAN: r0=132(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
