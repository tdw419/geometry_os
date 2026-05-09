; DESCRIPTION: Draws a magenta line from (125, 144) to (9, 50).
; PLAN: r0=125(x1), r1=144(y1), r2=9(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 144
LDI r2, 9
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
