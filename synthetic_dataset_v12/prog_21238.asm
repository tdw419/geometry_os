; DESCRIPTION: Draws a green line from (221, 208) to (19, 66).
; PLAN: r0=221(x1), r1=208(y1), r2=19(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 208
LDI r2, 19
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
