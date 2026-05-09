; DESCRIPTION: Draws a magenta line from (220, 220) to (416, 233).
; PLAN: r0=220(x1), r1=220(y1), r2=416(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 220
LDI r2, 416
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
