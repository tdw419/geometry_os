; DESCRIPTION: Places a blue line segment connecting (206, 197) to (132, 117).
; PLAN: r0=206(x1), r1=197(y1), r2=132(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 197
LDI r2, 132
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
