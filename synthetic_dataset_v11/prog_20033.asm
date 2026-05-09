; DESCRIPTION: Composite: . Then Sets a single orange pixel at (52, 42). Then Places a cyan line segment connecting (177, 120) to (86, 196).
; PLAN: r0=52(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=177(x1), r1=120(y1), r2=86(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (52, 42).
; PLAN: r0=52(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (177, 120) to (86, 196).
; PLAN: r0=177(x1), r1=120(y1), r2=86(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 120
LDI r2, 86
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
