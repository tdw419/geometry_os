; DESCRIPTION: Places a blue line segment connecting (79, 114) to (243, 220).
; PLAN: r0=79(x1), r1=114(y1), r2=243(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 114
LDI r2, 243
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
