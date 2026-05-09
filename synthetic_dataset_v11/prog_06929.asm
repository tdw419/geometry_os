; DESCRIPTION: Draws a magenta line from (0, 20) to (19, 86).
; PLAN: r0=0(x1), r1=20(y1), r2=19(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 20
LDI r2, 19
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
