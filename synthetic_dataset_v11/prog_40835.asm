; DESCRIPTION: Composite: . Then Places a yellow dot at position (180, 189). Then Draws a yellow line from (178, 145) to (72, 246).
; PLAN: r0=180(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=178(x1), r1=145(y1), r2=72(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (180, 189).
; PLAN: r0=180(x), r1=189(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 189
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow line from (178, 145) to (72, 246).
; PLAN: r0=178(x1), r1=145(y1), r2=72(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 145
LDI r2, 72
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
