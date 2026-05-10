; DESCRIPTION: Places a red line segment connecting (24, 208) to (470, 197).
; PLAN: r0=24(x1), r1=208(y1), r2=470(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 208
LDI r2, 470
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
