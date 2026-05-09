; DESCRIPTION: Draws a magenta line from (454, 48) to (86, 152).
; PLAN: r0=454(x1), r1=48(y1), r2=86(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 48
LDI r2, 86
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
