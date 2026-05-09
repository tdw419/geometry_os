; DESCRIPTION: Composite: . Then Places a blue line segment connecting (175, 123) to (75, 19). Then Places a red dot at position (103, 123).
; PLAN: r0=175(x1), r1=123(y1), r2=75(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=103(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue line segment connecting (175, 123) to (75, 19).
; PLAN: r0=175(x1), r1=123(y1), r2=75(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 123
LDI r2, 75
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (103, 123).
; PLAN: r0=103(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
