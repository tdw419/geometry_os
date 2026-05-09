; DESCRIPTION: Places a blue line segment connecting (75, 249) to (35, 167).
; PLAN: r0=75(x1), r1=249(y1), r2=35(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 249
LDI r2, 35
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
