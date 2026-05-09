; DESCRIPTION: Composite: . Then Draws a purple line from (5, 26) to (235, 243). Then Places a magenta dot at position (228, 2).
; PLAN: r0=5(x1), r1=26(y1), r2=235(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=228(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (5, 26) to (235, 243).
; PLAN: r0=5(x1), r1=26(y1), r2=235(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 26
LDI r2, 235
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (228, 2).
; PLAN: r0=228(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 2
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
