; DESCRIPTION: Places a blue line segment connecting (255, 63) to (65, 220).
; PLAN: r0=255(x1), r1=63(y1), r2=65(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 63
LDI r2, 65
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
