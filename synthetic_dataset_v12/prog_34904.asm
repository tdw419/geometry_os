; DESCRIPTION: Places a white line segment connecting (208, 176) to (38, 54).
; PLAN: r0=208(x1), r1=176(y1), r2=38(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 176
LDI r2, 38
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
