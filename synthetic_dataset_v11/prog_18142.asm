; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (172, 31). Then Places a green line segment connecting (179, 34) to (127, 215).
; PLAN: r0=172(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=179(x1), r1=34(y1), r2=127(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (172, 31).
; PLAN: r0=172(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (179, 34) to (127, 215).
; PLAN: r0=179(x1), r1=34(y1), r2=127(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 34
LDI r2, 127
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
