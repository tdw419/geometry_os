; DESCRIPTION: Draws a magenta line from (38, 132) to (174, 57).
; PLAN: r0=38(x1), r1=132(y1), r2=174(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 132
LDI r2, 174
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
