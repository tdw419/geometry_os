; DESCRIPTION: Draws a magenta line from (330, 249) to (15, 34).
; PLAN: r0=330(x1), r1=249(y1), r2=15(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 249
LDI r2, 15
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
