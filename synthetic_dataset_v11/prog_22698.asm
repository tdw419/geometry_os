; DESCRIPTION: Composite: . Then Places a red line segment connecting (148, 20) to (229, 62). Then Sets a single green pixel at (211, 158).
; PLAN: r0=148(x1), r1=20(y1), r2=229(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (148, 20) to (229, 62).
; PLAN: r0=148(x1), r1=20(y1), r2=229(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 20
LDI r2, 229
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (211, 158).
; PLAN: r0=211(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 158
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
