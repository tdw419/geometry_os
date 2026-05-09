; DESCRIPTION: Draws a purple line from (168, 161) to (369, 113).
; PLAN: r0=168(x1), r1=161(y1), r2=369(x2), r3=113(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 161
LDI r2, 369
LDI r3, 113
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
