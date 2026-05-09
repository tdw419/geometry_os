; DESCRIPTION: Draws a blue line from (114, 192) to (455, 113).
; PLAN: r0=114(x1), r1=192(y1), r2=455(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 192
LDI r2, 455
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
