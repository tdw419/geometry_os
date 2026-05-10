; DESCRIPTION: Draws a blue line from (252, 86) to (113, 44).
; PLAN: r0=252(x1), r1=86(y1), r2=113(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 86
LDI r2, 113
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
