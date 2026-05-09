; DESCRIPTION: Composite: . Then Places a red dot at position (44, 187). Then Draws a green line from (80, 241) to (190, 86).
; PLAN: r0=44(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=80(x1), r1=241(y1), r2=190(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (44, 187).
; PLAN: r0=44(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a green line from (80, 241) to (190, 86).
; PLAN: r0=80(x1), r1=241(y1), r2=190(x2), r3=86(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 241
LDI r2, 190
LDI r3, 86
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
