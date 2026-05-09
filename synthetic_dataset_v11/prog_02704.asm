; DESCRIPTION: Composite: . Then Draws a magenta line from (100, 182) to (188, 71). Then Places a red dot at position (221, 192).
; PLAN: r0=100(x1), r1=182(y1), r2=188(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=221(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (100, 182) to (188, 71).
; PLAN: r0=100(x1), r1=182(y1), r2=188(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 182
LDI r2, 188
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (221, 192).
; PLAN: r0=221(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
