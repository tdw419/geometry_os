; DESCRIPTION: Draws a magenta line from (195, 38) to (281, 89).
; PLAN: r0=195(x1), r1=38(y1), r2=281(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 38
LDI r2, 281
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
