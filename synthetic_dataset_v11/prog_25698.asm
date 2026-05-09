; DESCRIPTION: Draws a magenta line from (98, 48) to (170, 178).
; PLAN: r0=98(x1), r1=48(y1), r2=170(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 48
LDI r2, 170
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
