; DESCRIPTION: Places a cyan line segment connecting (133, 28) to (162, 186).
; PLAN: r0=133(x1), r1=28(y1), r2=162(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 28
LDI r2, 162
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
