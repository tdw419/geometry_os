; DESCRIPTION: Composite: . Then Draws a cyan line from (137, 80) to (171, 29). Then Sets a single red pixel at (99, 165).
; PLAN: r0=137(x1), r1=80(y1), r2=171(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=99(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan line from (137, 80) to (171, 29).
; PLAN: r0=137(x1), r1=80(y1), r2=171(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 80
LDI r2, 171
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (99, 165).
; PLAN: r0=99(x), r1=165(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 99
LDI r1, 165
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
