; DESCRIPTION: Draws a magenta line from (213, 202) to (57, 58).
; PLAN: r0=213(x1), r1=202(y1), r2=57(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 202
LDI r2, 57
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
