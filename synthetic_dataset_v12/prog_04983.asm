; DESCRIPTION: Draws a magenta line from (402, 171) to (56, 220).
; PLAN: r0=402(x1), r1=171(y1), r2=56(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 171
LDI r2, 56
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
