; DESCRIPTION: Draws a magenta line from (508, 211) to (180, 86).
; PLAN: r0=508(x1), r1=211(y1), r2=180(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 211
LDI r2, 180
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
