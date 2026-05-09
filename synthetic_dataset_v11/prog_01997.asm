; DESCRIPTION: Places a red line segment connecting (144, 149) to (25, 205).
; PLAN: r0=144(x1), r1=149(y1), r2=25(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 149
LDI r2, 25
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
