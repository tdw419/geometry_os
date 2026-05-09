; DESCRIPTION: Places a blue line segment connecting (161, 101) to (90, 213).
; PLAN: r0=161(x1), r1=101(y1), r2=90(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 101
LDI r2, 90
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
