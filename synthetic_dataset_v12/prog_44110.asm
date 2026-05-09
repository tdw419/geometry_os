; DESCRIPTION: Places a blue line segment connecting (391, 121) to (386, 231).
; PLAN: r0=391(x1), r1=121(y1), r2=386(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 121
LDI r2, 386
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
