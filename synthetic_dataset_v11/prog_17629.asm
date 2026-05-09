; DESCRIPTION: Composite: . Then Places a red line segment connecting (94, 229) to (106, 54). Then Places a cyan dot at position (166, 20).
; PLAN: r0=94(x1), r1=229(y1), r2=106(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (94, 229) to (106, 54).
; PLAN: r0=94(x1), r1=229(y1), r2=106(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 229
LDI r2, 106
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (166, 20).
; PLAN: r0=166(x), r1=20(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 20
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
