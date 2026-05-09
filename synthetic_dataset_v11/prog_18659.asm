; DESCRIPTION: Composite: . Then Places a cyan dot at position (103, 31). Then Places a orange line segment connecting (100, 131) to (12, 152).
; PLAN: r0=103(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=100(x1), r1=131(y1), r2=12(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (103, 31).
; PLAN: r0=103(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (100, 131) to (12, 152).
; PLAN: r0=100(x1), r1=131(y1), r2=12(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 131
LDI r2, 12
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
