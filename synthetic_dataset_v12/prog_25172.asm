; DESCRIPTION: Draws a magenta line from (68, 17) to (262, 52).
; PLAN: r0=68(x1), r1=17(y1), r2=262(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 17
LDI r2, 262
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
