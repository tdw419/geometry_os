; DESCRIPTION: Draws a magenta line from (417, 231) to (14, 244).
; PLAN: r0=417(x1), r1=231(y1), r2=14(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 231
LDI r2, 14
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
