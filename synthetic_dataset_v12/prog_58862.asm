; DESCRIPTION: Draws a magenta line from (435, 160) to (413, 152).
; PLAN: r0=435(x1), r1=160(y1), r2=413(x2), r3=152(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 160
LDI r2, 413
LDI r3, 152
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
