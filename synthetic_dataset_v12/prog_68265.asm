; DESCRIPTION: Places a blue line segment connecting (434, 197) to (132, 236).
; PLAN: r0=434(x1), r1=197(y1), r2=132(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 197
LDI r2, 132
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
