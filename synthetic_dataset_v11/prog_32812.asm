; DESCRIPTION: Draws a magenta line from (195, 225) to (50, 133).
; PLAN: r0=195(x1), r1=225(y1), r2=50(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 225
LDI r2, 50
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
