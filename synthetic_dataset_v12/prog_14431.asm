; DESCRIPTION: Draws a magenta line from (273, 69) to (5, 37).
; PLAN: r0=273(x1), r1=69(y1), r2=5(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 69
LDI r2, 5
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
