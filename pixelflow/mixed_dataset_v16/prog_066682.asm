; DESCRIPTION: Draws a magenta line from (252, 79) to (168, 142).
; PLAN: r0=252(x1), r1=79(y1), r2=168(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 79
LDI r2, 168
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
