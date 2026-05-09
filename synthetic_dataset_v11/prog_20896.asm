; DESCRIPTION: Places a green line segment connecting (110, 150) to (24, 50).
; PLAN: r0=110(x1), r1=150(y1), r2=24(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 150
LDI r2, 24
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
