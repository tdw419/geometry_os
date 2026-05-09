; DESCRIPTION: Draws a magenta line from (20, 198) to (233, 215).
; PLAN: r0=20(x1), r1=198(y1), r2=233(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 198
LDI r2, 233
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
