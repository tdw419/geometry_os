; DESCRIPTION: Draws a magenta line from (126, 170) to (149, 143).
; PLAN: r0=126(x1), r1=170(y1), r2=149(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 170
LDI r2, 149
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
