; DESCRIPTION: Draws a yellow line from (19, 177) to (146, 119).
; PLAN: r0=19(x1), r1=177(y1), r2=146(x2), r3=119(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 177
LDI r2, 146
LDI r3, 119
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
