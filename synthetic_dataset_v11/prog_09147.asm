; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (76, 254) to (38, 174). Then Sets a single yellow pixel at (29, 218).
; PLAN: r0=76(x1), r1=254(y1), r2=38(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=29(x), r1=218(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (76, 254) to (38, 174).
; PLAN: r0=76(x1), r1=254(y1), r2=38(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 254
LDI r2, 38
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (29, 218).
; PLAN: r0=29(x), r1=218(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 218
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
