; DESCRIPTION: Draws a green line from (279, 162) to (66, 30).
; PLAN: r0=279(x1), r1=162(y1), r2=66(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 162
LDI r2, 66
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
