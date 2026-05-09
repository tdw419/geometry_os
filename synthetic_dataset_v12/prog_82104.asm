; DESCRIPTION: Places a green line segment connecting (220, 29) to (150, 85).
; PLAN: r0=220(x1), r1=29(y1), r2=150(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 29
LDI r2, 150
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
