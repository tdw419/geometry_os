; DESCRIPTION: Places a blue line segment connecting (123, 176) to (75, 75).
; PLAN: r0=123(x1), r1=176(y1), r2=75(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 176
LDI r2, 75
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
