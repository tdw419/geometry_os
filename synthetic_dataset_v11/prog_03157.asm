; DESCRIPTION: Composite: . Then Draws a magenta line from (190, 253) to (112, 125). Then Sets a single yellow pixel at (211, 19).
; PLAN: r0=190(x1), r1=253(y1), r2=112(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=211(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (190, 253) to (112, 125).
; PLAN: r0=190(x1), r1=253(y1), r2=112(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 253
LDI r2, 112
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (211, 19).
; PLAN: r0=211(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
