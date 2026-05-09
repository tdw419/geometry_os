; DESCRIPTION: Draws a purple line from (146, 226) to (98, 37).
; PLAN: r0=146(x1), r1=226(y1), r2=98(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 226
LDI r2, 98
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
