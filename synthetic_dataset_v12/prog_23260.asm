; DESCRIPTION: Places a blue line segment connecting (425, 180) to (90, 249).
; PLAN: r0=425(x1), r1=180(y1), r2=90(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 180
LDI r2, 90
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
