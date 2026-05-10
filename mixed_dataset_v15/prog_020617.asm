; DESCRIPTION: Draws a magenta line from (106, 229) to (255, 13).
; PLAN: r0=106(x1), r1=229(y1), r2=255(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 229
LDI r2, 255
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
