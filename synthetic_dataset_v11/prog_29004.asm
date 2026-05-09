; DESCRIPTION: Composite: . Then Places a cyan dot at position (141, 126). Then Draws a purple line from (79, 225) to (206, 102).
; PLAN: r0=141(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=79(x1), r1=225(y1), r2=206(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (141, 126).
; PLAN: r0=141(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 126
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (79, 225) to (206, 102).
; PLAN: r0=79(x1), r1=225(y1), r2=206(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 225
LDI r2, 206
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
