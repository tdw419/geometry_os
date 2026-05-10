; DESCRIPTION: Draws a magenta line from (180, 187) to (48, 61).
; PLAN: r0=180(x1), r1=187(y1), r2=48(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 187
LDI r2, 48
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
