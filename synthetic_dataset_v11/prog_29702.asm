; DESCRIPTION: Draws a magenta line from (143, 143) to (225, 51).
; PLAN: r0=143(x1), r1=143(y1), r2=225(x2), r3=51(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 143
LDI r2, 225
LDI r3, 51
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
