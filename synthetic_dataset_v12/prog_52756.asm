; DESCRIPTION: Draws a magenta line from (392, 81) to (188, 195).
; PLAN: r0=392(x1), r1=81(y1), r2=188(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 81
LDI r2, 188
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
