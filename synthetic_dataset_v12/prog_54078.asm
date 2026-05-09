; DESCRIPTION: Draws a magenta line from (70, 96) to (152, 54).
; PLAN: r0=70(x1), r1=96(y1), r2=152(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 96
LDI r2, 152
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
