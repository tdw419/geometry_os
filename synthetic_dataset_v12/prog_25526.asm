; DESCRIPTION: Draws a magenta line from (172, 20) to (123, 134).
; PLAN: r0=172(x1), r1=20(y1), r2=123(x2), r3=134(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 20
LDI r2, 123
LDI r3, 134
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
