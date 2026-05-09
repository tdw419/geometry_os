; DESCRIPTION: Composite: . Then Sets a single red pixel at (111, 107). Then Draws a cyan line from (28, 110) to (103, 155).
; PLAN: r0=111(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=110(y1), r2=103(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (111, 107).
; PLAN: r0=111(x), r1=107(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 107
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (28, 110) to (103, 155).
; PLAN: r0=28(x1), r1=110(y1), r2=103(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 110
LDI r2, 103
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
