; DESCRIPTION: Places a green line segment connecting (94, 146) to (70, 118).
; PLAN: r0=94(x1), r1=146(y1), r2=70(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 146
LDI r2, 70
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
