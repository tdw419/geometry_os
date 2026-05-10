; DESCRIPTION: Places a cyan line segment connecting (464, 89) to (158, 24).
; PLAN: r0=464(x1), r1=89(y1), r2=158(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 89
LDI r2, 158
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
