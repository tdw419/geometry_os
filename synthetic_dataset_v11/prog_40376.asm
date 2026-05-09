; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (176, 217) to (127, 238). Then Places a orange dot at position (46, 249).
; PLAN: r0=176(x1), r1=217(y1), r2=127(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (176, 217) to (127, 238).
; PLAN: r0=176(x1), r1=217(y1), r2=127(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 217
LDI r2, 127
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange dot at position (46, 249).
; PLAN: r0=46(x), r1=249(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 249
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
