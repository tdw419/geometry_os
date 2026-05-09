; DESCRIPTION: Composite: . Then Draws a purple line from (195, 5) to (212, 37). Then Places a green dot at position (124, 51).
; PLAN: r0=195(x1), r1=5(y1), r2=212(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=124(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (195, 5) to (212, 37).
; PLAN: r0=195(x1), r1=5(y1), r2=212(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 5
LDI r2, 212
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (124, 51).
; PLAN: r0=124(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
