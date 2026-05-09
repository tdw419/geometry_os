; DESCRIPTION: Composite: . Then Sets a single green pixel at (188, 61). Then Draws a magenta line from (195, 222) to (248, 100).
; PLAN: r0=188(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=195(x1), r1=222(y1), r2=248(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (188, 61).
; PLAN: r0=188(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta line from (195, 222) to (248, 100).
; PLAN: r0=195(x1), r1=222(y1), r2=248(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 222
LDI r2, 248
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
