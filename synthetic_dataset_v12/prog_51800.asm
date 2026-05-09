; DESCRIPTION: Places a cyan line segment connecting (64, 70) to (411, 118).
; PLAN: r0=64(x1), r1=70(y1), r2=411(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 70
LDI r2, 411
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
