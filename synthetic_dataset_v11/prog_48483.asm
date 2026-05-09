; DESCRIPTION: Composite: . Then Places a red dot at position (119, 97). Then Draws a blue line from (138, 174) to (13, 109).
; PLAN: r0=119(x), r1=97(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=138(x1), r1=174(y1), r2=13(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (119, 97).
; PLAN: r0=119(x), r1=97(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 119
LDI r1, 97
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (138, 174) to (13, 109).
; PLAN: r0=138(x1), r1=174(y1), r2=13(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 174
LDI r2, 13
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
