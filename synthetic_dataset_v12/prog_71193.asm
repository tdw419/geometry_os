; DESCRIPTION: Draws a magenta line from (435, 155) to (86, 198).
; PLAN: r0=435(x1), r1=155(y1), r2=86(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 155
LDI r2, 86
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
