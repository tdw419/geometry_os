; DESCRIPTION: Composite: . Then Sets a single black pixel at (138, 131). Then Draws a black line from (221, 231) to (144, 90).
; PLAN: r0=138(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=221(x1), r1=231(y1), r2=144(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (138, 131).
; PLAN: r0=138(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a black line from (221, 231) to (144, 90).
; PLAN: r0=221(x1), r1=231(y1), r2=144(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 231
LDI r2, 144
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
