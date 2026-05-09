; DESCRIPTION: Draws a magenta line from (371, 89) to (206, 209).
; PLAN: r0=371(x1), r1=89(y1), r2=206(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 89
LDI r2, 206
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
