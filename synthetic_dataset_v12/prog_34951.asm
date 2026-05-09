; DESCRIPTION: Draws a magenta line from (173, 212) to (109, 143).
; PLAN: r0=173(x1), r1=212(y1), r2=109(x2), r3=143(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 212
LDI r2, 109
LDI r3, 143
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
