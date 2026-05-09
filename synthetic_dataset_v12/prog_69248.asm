; DESCRIPTION: Draws a magenta line from (109, 2) to (370, 228).
; PLAN: r0=109(x1), r1=2(y1), r2=370(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 2
LDI r2, 370
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
