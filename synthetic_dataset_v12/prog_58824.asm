; DESCRIPTION: Places a cyan line segment connecting (176, 106) to (423, 208).
; PLAN: r0=176(x1), r1=106(y1), r2=423(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 106
LDI r2, 423
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
