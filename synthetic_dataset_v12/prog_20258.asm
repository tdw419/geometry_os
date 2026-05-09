; DESCRIPTION: Draws a magenta line from (385, 54) to (264, 254).
; PLAN: r0=385(x1), r1=54(y1), r2=264(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 54
LDI r2, 264
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
