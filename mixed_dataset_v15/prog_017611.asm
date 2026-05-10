; DESCRIPTION: Draws a magenta line from (216, 95) to (231, 195).
; PLAN: r0=216(x1), r1=95(y1), r2=231(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 95
LDI r2, 231
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
