; DESCRIPTION: Renders a magenta line between points (357, 206) and (371, 152).
; PLAN: r0=357(x1), r1=206(y1), r2=371(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 206
LDI r2, 371
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
