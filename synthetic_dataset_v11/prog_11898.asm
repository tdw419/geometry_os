; DESCRIPTION: Composite: . Then Draws a magenta line from (111, 75) to (182, 33). Then Sets a single black pixel at (122, 47).
; PLAN: r0=111(x1), r1=75(y1), r2=182(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (111, 75) to (182, 33).
; PLAN: r0=111(x1), r1=75(y1), r2=182(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 75
LDI r2, 182
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (122, 47).
; PLAN: r0=122(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 47
LDI r2, 0x000000
PSET r0, r1, r2
HALT
