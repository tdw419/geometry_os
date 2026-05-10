; DESCRIPTION: Draws a yellow line from (195, 146) to (11, 220).
; PLAN: r0=195(x1), r1=146(y1), r2=11(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 146
LDI r2, 11
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
