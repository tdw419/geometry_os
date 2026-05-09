; DESCRIPTION: Composite: . Then Draws a black line from (107, 103) to (237, 9). Then Places a magenta dot at position (102, 90).
; PLAN: r0=107(x1), r1=103(y1), r2=237(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=90(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black line from (107, 103) to (237, 9).
; PLAN: r0=107(x1), r1=103(y1), r2=237(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 103
LDI r2, 237
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (102, 90).
; PLAN: r0=102(x), r1=90(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 90
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
