; DESCRIPTION: Places a blue line segment connecting (391, 60) to (255, 92).
; PLAN: r0=391(x1), r1=60(y1), r2=255(x2), r3=92(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 60
LDI r2, 255
LDI r3, 92
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
