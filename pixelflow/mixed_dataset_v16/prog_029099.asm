; DESCRIPTION: Places a cyan line segment connecting (100, 120) to (455, 85).
; PLAN: r0=100(x1), r1=120(y1), r2=455(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 120
LDI r2, 455
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
