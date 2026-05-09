; DESCRIPTION: Places a cyan line segment connecting (70, 143) to (149, 2).
; PLAN: r0=70(x1), r1=143(y1), r2=149(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 143
LDI r2, 149
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
