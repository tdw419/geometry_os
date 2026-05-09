; DESCRIPTION: Draws a blue line from (58, 150) to (146, 113).
; PLAN: r0=58(x1), r1=150(y1), r2=146(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 150
LDI r2, 146
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
