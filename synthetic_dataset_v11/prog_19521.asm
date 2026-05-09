; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (242, 91). Then Draws a cyan line from (163, 94) to (47, 45).
; PLAN: r0=242(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=163(x1), r1=94(y1), r2=47(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (242, 91).
; PLAN: r0=242(x), r1=91(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 242
LDI r1, 91
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (163, 94) to (47, 45).
; PLAN: r0=163(x1), r1=94(y1), r2=47(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 94
LDI r2, 47
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
