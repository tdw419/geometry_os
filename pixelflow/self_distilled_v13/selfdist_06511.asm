; DESCRIPTION: Draws a magenta line from (226, 56) to (16, 120).
; PLAN: r0=226(x1), r1=56(y1), r2=16(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 56
LDI r2, 16
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
