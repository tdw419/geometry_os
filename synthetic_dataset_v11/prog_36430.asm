; DESCRIPTION: Composite: . Then Sets a single green pixel at (107, 92). Then Places a magenta line segment connecting (19, 120) to (106, 122).
; PLAN: r0=107(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=19(x1), r1=120(y1), r2=106(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (107, 92).
; PLAN: r0=107(x), r1=92(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 92
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (19, 120) to (106, 122).
; PLAN: r0=19(x1), r1=120(y1), r2=106(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 120
LDI r2, 106
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
