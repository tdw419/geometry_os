; DESCRIPTION: Composite: . Then Draws a white line from (162, 138) to (139, 5). Then Sets a single red pixel at (117, 182).
; PLAN: r0=162(x1), r1=138(y1), r2=139(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white line from (162, 138) to (139, 5).
; PLAN: r0=162(x1), r1=138(y1), r2=139(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 138
LDI r2, 139
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (117, 182).
; PLAN: r0=117(x), r1=182(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 182
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
