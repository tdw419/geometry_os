; DESCRIPTION: Composite: . Then Places a green line segment connecting (183, 48) to (1, 42). Then Sets a single orange pixel at (241, 134).
; PLAN: r0=183(x1), r1=48(y1), r2=1(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=241(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (183, 48) to (1, 42).
; PLAN: r0=183(x1), r1=48(y1), r2=1(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 48
LDI r2, 1
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (241, 134).
; PLAN: r0=241(x), r1=134(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 134
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
