; DESCRIPTION: Draws a magenta line from (65, 12) to (248, 127).
; PLAN: r0=65(x1), r1=12(y1), r2=248(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 12
LDI r2, 248
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
