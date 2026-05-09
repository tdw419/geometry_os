; DESCRIPTION: Composite: . Then Renders a orange line between points (247, 22) and (202, 42). Then Sets a single blue pixel at (137, 44).
; PLAN: r0=247(x1), r1=22(y1), r2=202(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=137(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (247, 22) and (202, 42).
; PLAN: r0=247(x1), r1=22(y1), r2=202(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 22
LDI r2, 202
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (137, 44).
; PLAN: r0=137(x), r1=44(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 44
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
