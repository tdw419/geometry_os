; DESCRIPTION: Composite: . Then Places a orange line segment connecting (211, 69) to (49, 34). Then Places a orange dot at position (153, 75).
; PLAN: r0=211(x1), r1=69(y1), r2=49(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=153(x), r1=75(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (211, 69) to (49, 34).
; PLAN: r0=211(x1), r1=69(y1), r2=49(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 69
LDI r2, 49
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (153, 75).
; PLAN: r0=153(x), r1=75(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 75
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
