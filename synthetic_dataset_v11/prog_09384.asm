; DESCRIPTION: Composite: . Then Draws a magenta line from (155, 243) to (179, 132). Then Places a black dot at position (95, 153).
; PLAN: r0=155(x1), r1=243(y1), r2=179(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta line from (155, 243) to (179, 132).
; PLAN: r0=155(x1), r1=243(y1), r2=179(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 243
LDI r2, 179
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (95, 153).
; PLAN: r0=95(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
HALT
