; DESCRIPTION: Draws a magenta line from (206, 124) to (47, 132).
; PLAN: r0=206(x1), r1=124(y1), r2=47(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 124
LDI r2, 47
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
