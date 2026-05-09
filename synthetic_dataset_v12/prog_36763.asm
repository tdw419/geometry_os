; DESCRIPTION: Places a red line segment connecting (110, 149) to (180, 84).
; PLAN: r0=110(x1), r1=149(y1), r2=180(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 149
LDI r2, 180
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
