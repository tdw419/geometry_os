; DESCRIPTION: Places a orange line segment connecting (115, 161) to (70, 192).
; PLAN: r0=115(x1), r1=161(y1), r2=70(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 161
LDI r2, 70
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
