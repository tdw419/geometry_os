; DESCRIPTION: Places a blue line segment connecting (249, 100) to (71, 213).
; PLAN: r0=249(x1), r1=100(y1), r2=71(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 100
LDI r2, 71
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
