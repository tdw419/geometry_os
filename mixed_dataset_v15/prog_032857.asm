; DESCRIPTION: Draws a magenta line from (440, 146) to (7, 68).
; PLAN: r0=440(x1), r1=146(y1), r2=7(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 146
LDI r2, 7
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
