; DESCRIPTION: Draws a green line from (307, 211) to (279, 145).
; PLAN: r0=307(x1), r1=211(y1), r2=279(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 211
LDI r2, 279
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
