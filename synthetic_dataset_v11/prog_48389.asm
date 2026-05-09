; DESCRIPTION: Composite: . Then Sets a single black pixel at (20, 13). Then Places a red line segment connecting (91, 205) to (182, 81).
; PLAN: r0=20(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=91(x1), r1=205(y1), r2=182(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (20, 13).
; PLAN: r0=20(x), r1=13(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 13
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (91, 205) to (182, 81).
; PLAN: r0=91(x1), r1=205(y1), r2=182(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 205
LDI r2, 182
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
