; DESCRIPTION: Draws a magenta line from (21, 200) to (108, 48).
; PLAN: r0=21(x1), r1=200(y1), r2=108(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 200
LDI r2, 108
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
