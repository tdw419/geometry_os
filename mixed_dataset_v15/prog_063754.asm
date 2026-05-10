; DESCRIPTION: Draws a magenta line from (249, 70) to (322, 173).
; PLAN: r0=249(x1), r1=70(y1), r2=322(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 70
LDI r2, 322
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
