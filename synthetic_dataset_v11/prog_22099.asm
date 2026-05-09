; DESCRIPTION: Composite: . Then Places a green line segment connecting (182, 64) to (42, 51). Then Sets a single yellow pixel at (104, 181).
; PLAN: r0=182(x1), r1=64(y1), r2=42(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=104(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green line segment connecting (182, 64) to (42, 51).
; PLAN: r0=182(x1), r1=64(y1), r2=42(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 64
LDI r2, 42
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (104, 181).
; PLAN: r0=104(x), r1=181(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 181
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
