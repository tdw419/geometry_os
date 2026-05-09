; DESCRIPTION: Composite: . Then Draws a purple line from (221, 249) to (212, 94). Then Places a cyan dot at position (18, 93).
; PLAN: r0=221(x1), r1=249(y1), r2=212(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=18(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (221, 249) to (212, 94).
; PLAN: r0=221(x1), r1=249(y1), r2=212(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 249
LDI r2, 212
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (18, 93).
; PLAN: r0=18(x), r1=93(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 93
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
