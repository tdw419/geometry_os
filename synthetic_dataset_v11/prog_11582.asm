; DESCRIPTION: Composite: . Then Draws a red line from (156, 39) to (180, 88). Then Places a purple dot at position (235, 240).
; PLAN: r0=156(x1), r1=39(y1), r2=180(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=235(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red line from (156, 39) to (180, 88).
; PLAN: r0=156(x1), r1=39(y1), r2=180(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 39
LDI r2, 180
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (235, 240).
; PLAN: r0=235(x), r1=240(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 235
LDI r1, 240
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
