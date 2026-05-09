; DESCRIPTION: Draws a magenta line from (143, 93) to (489, 113).
; PLAN: r0=143(x1), r1=93(y1), r2=489(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 93
LDI r2, 489
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
