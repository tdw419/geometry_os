; DESCRIPTION: Places a blue line segment connecting (479, 244) to (145, 152).
; PLAN: r0=479(x1), r1=244(y1), r2=145(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 244
LDI r2, 145
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
