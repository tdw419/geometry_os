; DESCRIPTION: Composite: . Then Places a green dot at position (31, 10). Then Places a green line segment connecting (52, 98) to (94, 207).
; PLAN: r0=31(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=52(x1), r1=98(y1), r2=94(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (31, 10).
; PLAN: r0=31(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a green line segment connecting (52, 98) to (94, 207).
; PLAN: r0=52(x1), r1=98(y1), r2=94(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 98
LDI r2, 94
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
