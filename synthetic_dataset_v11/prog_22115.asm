; DESCRIPTION: Draws a magenta line from (66, 210) to (213, 47).
; PLAN: r0=66(x1), r1=210(y1), r2=213(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 210
LDI r2, 213
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
