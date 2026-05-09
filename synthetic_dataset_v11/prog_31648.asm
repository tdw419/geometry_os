; DESCRIPTION: Composite: . Then Places a green line segment connecting (108, 196) to (11, 153). Then Sets a single orange pixel at (109, 117).
; PLAN: r0=108(x1), r1=196(y1), r2=11(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=109(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (108, 196) to (11, 153).
; PLAN: r0=108(x1), r1=196(y1), r2=11(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 196
LDI r2, 11
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (109, 117).
; PLAN: r0=109(x), r1=117(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 117
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
