; DESCRIPTION: Composite: . Then Places a orange line segment connecting (90, 37) to (93, 15). Then Sets a single cyan pixel at (4, 152).
; PLAN: r0=90(x1), r1=37(y1), r2=93(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=4(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (90, 37) to (93, 15).
; PLAN: r0=90(x1), r1=37(y1), r2=93(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 37
LDI r2, 93
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (4, 152).
; PLAN: r0=4(x), r1=152(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 152
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
