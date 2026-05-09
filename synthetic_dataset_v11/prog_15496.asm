; DESCRIPTION: Places a red line segment connecting (159, 37) to (135, 150).
; PLAN: r0=159(x1), r1=37(y1), r2=135(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 37
LDI r2, 135
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
