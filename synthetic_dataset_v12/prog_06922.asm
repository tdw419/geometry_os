; DESCRIPTION: Places a green line segment connecting (462, 141) to (54, 167).
; PLAN: r0=462(x1), r1=141(y1), r2=54(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 141
LDI r2, 54
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
