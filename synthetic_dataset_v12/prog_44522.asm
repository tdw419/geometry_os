; DESCRIPTION: Places a green line segment connecting (443, 150) to (7, 155).
; PLAN: r0=443(x1), r1=150(y1), r2=7(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 150
LDI r2, 7
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
