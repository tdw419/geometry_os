; DESCRIPTION: Draws a magenta line from (237, 144) to (223, 223).
; PLAN: r0=237(x1), r1=144(y1), r2=223(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 144
LDI r2, 223
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
