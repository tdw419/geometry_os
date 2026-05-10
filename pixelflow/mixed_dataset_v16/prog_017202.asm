; DESCRIPTION: Places a cyan line segment connecting (157, 204) to (84, 74).
; PLAN: r0=157(x1), r1=204(y1), r2=84(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 204
LDI r2, 84
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
