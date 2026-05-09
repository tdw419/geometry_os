; DESCRIPTION: Places a cyan line segment connecting (162, 139) to (133, 113).
; PLAN: r0=162(x1), r1=139(y1), r2=133(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 139
LDI r2, 133
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
