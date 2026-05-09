; DESCRIPTION: Draws a magenta line from (218, 162) to (80, 231).
; PLAN: r0=218(x1), r1=162(y1), r2=80(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 162
LDI r2, 80
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
