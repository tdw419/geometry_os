; DESCRIPTION: Draws a green line from (250, 177) to (82, 105).
; PLAN: r0=250(x1), r1=177(y1), r2=82(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 177
LDI r2, 82
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
