; DESCRIPTION: Places a cyan line segment connecting (100, 70) to (186, 62).
; PLAN: r0=100(x1), r1=70(y1), r2=186(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 70
LDI r2, 186
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
