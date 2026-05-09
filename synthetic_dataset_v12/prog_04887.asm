; DESCRIPTION: Draws a magenta line from (5, 225) to (47, 231).
; PLAN: r0=5(x1), r1=225(y1), r2=47(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 225
LDI r2, 47
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
