; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (166, 183) to (10, 50). Then Places a cyan dot at position (78, 94).
; PLAN: r0=166(x1), r1=183(y1), r2=10(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=78(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (166, 183) to (10, 50).
; PLAN: r0=166(x1), r1=183(y1), r2=10(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 183
LDI r2, 10
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (78, 94).
; PLAN: r0=78(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
