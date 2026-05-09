; DESCRIPTION: Draws a magenta line from (248, 81) to (50, 35).
; PLAN: r0=248(x1), r1=81(y1), r2=50(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 81
LDI r2, 50
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
