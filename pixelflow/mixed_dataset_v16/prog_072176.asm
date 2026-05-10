; DESCRIPTION: Draws a magenta line from (115, 14) to (330, 121).
; PLAN: r0=115(x1), r1=14(y1), r2=330(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 14
LDI r2, 330
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
