; DESCRIPTION: Places a blue line segment connecting (187, 74) to (71, 88).
; PLAN: r0=187(x1), r1=74(y1), r2=71(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 74
LDI r2, 71
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
