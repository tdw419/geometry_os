; DESCRIPTION: Places a green line segment connecting (44, 44) to (161, 167).
; PLAN: r0=44(x1), r1=44(y1), r2=161(x2), r3=167(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 44
LDI r2, 161
LDI r3, 167
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
