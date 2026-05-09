; DESCRIPTION: Draws a magenta line from (393, 133) to (404, 231).
; PLAN: r0=393(x1), r1=133(y1), r2=404(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 133
LDI r2, 404
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
