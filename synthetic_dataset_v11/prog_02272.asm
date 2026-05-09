; DESCRIPTION: Draws a magenta line from (225, 208) to (4, 156).
; PLAN: r0=225(x1), r1=208(y1), r2=4(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 208
LDI r2, 4
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
