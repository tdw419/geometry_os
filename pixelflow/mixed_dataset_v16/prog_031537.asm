; DESCRIPTION: Draws a magenta line from (453, 42) to (26, 159).
; PLAN: r0=453(x1), r1=42(y1), r2=26(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 42
LDI r2, 26
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
