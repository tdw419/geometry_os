; DESCRIPTION: Composite: . Then Places a magenta line segment connecting (73, 47) to (35, 117). Then Sets a single cyan pixel at (246, 25).
; PLAN: r0=73(x1), r1=47(y1), r2=35(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=246(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta line segment connecting (73, 47) to (35, 117).
; PLAN: r0=73(x1), r1=47(y1), r2=35(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 47
LDI r2, 35
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (246, 25).
; PLAN: r0=246(x), r1=25(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 25
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
