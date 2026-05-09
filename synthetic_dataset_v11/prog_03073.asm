; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (222, 42) to (101, 36). Then Sets a single yellow pixel at (216, 170).
; PLAN: r0=222(x1), r1=42(y1), r2=101(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=216(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (222, 42) to (101, 36).
; PLAN: r0=222(x1), r1=42(y1), r2=101(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 42
LDI r2, 101
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (216, 170).
; PLAN: r0=216(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
