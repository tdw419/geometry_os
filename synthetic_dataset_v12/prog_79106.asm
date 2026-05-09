; DESCRIPTION: Places a green line segment connecting (423, 135) to (423, 167).
; PLAN: r0=423(x1), r1=135(y1), r2=423(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 135
LDI r2, 423
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
