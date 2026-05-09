; DESCRIPTION: Composite: . Then Draws a magenta line from (205, 188) to (202, 155). Then Sets a single yellow pixel at (119, 100).
; PLAN: r0=205(x1), r1=188(y1), r2=202(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=119(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (205, 188) to (202, 155).
; PLAN: r0=205(x1), r1=188(y1), r2=202(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 188
LDI r2, 202
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (119, 100).
; PLAN: r0=119(x), r1=100(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 100
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
