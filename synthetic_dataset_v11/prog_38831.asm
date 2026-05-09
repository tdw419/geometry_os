; DESCRIPTION: Draws a blue line from (80, 140) to (64, 113).
; PLAN: r0=80(x1), r1=140(y1), r2=64(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 140
LDI r2, 64
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
