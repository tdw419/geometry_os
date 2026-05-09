; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (84, 239). Then Draws a green line from (137, 191) to (161, 158).
; PLAN: r0=84(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=137(x1), r1=191(y1), r2=161(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (84, 239).
; PLAN: r0=84(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (137, 191) to (161, 158).
; PLAN: r0=137(x1), r1=191(y1), r2=161(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 191
LDI r2, 161
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
