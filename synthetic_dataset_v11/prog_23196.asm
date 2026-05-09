; DESCRIPTION: Places a cyan line segment connecting (208, 120) to (176, 106).
; PLAN: r0=208(x1), r1=120(y1), r2=176(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 120
LDI r2, 176
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
