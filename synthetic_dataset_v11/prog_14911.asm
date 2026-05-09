; DESCRIPTION: Composite: . Then Places a yellow dot at position (77, 111). Then Draws a purple line from (149, 162) to (247, 215).
; PLAN: r0=77(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=149(x1), r1=162(y1), r2=247(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (77, 111).
; PLAN: r0=77(x), r1=111(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 111
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple line from (149, 162) to (247, 215).
; PLAN: r0=149(x1), r1=162(y1), r2=247(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 162
LDI r2, 247
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
