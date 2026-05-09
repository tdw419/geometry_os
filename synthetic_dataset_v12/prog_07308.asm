; DESCRIPTION: Draws a magenta line from (132, 228) to (74, 36).
; PLAN: r0=132(x1), r1=228(y1), r2=74(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 228
LDI r2, 74
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
