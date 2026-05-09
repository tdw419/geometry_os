; DESCRIPTION: Composite: . Then Places a white line segment connecting (157, 102) to (13, 221). Then Sets a single magenta pixel at (108, 173).
; PLAN: r0=157(x1), r1=102(y1), r2=13(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=108(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white line segment connecting (157, 102) to (13, 221).
; PLAN: r0=157(x1), r1=102(y1), r2=13(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 102
LDI r2, 13
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (108, 173).
; PLAN: r0=108(x), r1=173(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 173
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
