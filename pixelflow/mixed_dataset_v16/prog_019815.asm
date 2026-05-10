; DESCRIPTION: Draws a magenta line from (151, 5) to (466, 57).
; PLAN: r0=151(x1), r1=5(y1), r2=466(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 466
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
