; DESCRIPTION: Draws a blue line from (150, 134) to (63, 48).
; PLAN: r0=150(x1), r1=134(y1), r2=63(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 134
LDI r2, 63
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
