; DESCRIPTION: Composite: . Then Sets a single purple pixel at (194, 50). Then Places a magenta line segment connecting (43, 135) to (39, 58).
; PLAN: r0=194(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=43(x1), r1=135(y1), r2=39(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (194, 50).
; PLAN: r0=194(x), r1=50(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 50
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta line segment connecting (43, 135) to (39, 58).
; PLAN: r0=43(x1), r1=135(y1), r2=39(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 135
LDI r2, 39
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
