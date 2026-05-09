; DESCRIPTION: Draws a magenta line from (194, 149) to (57, 174).
; PLAN: r0=194(x1), r1=149(y1), r2=57(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 149
LDI r2, 57
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
