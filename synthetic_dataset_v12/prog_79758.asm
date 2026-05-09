; DESCRIPTION: Places a green line segment connecting (78, 180) to (328, 160).
; PLAN: r0=78(x1), r1=180(y1), r2=328(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 180
LDI r2, 328
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
