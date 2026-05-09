; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (147, 160) to (31, 47). Then Sets a single green pixel at (45, 108).
; PLAN: r0=147(x1), r1=160(y1), r2=31(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=45(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (147, 160) to (31, 47).
; PLAN: r0=147(x1), r1=160(y1), r2=31(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 160
LDI r2, 31
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (45, 108).
; PLAN: r0=45(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
