; DESCRIPTION: Places a cyan line segment connecting (176, 233) to (68, 217).
; PLAN: r0=176(x1), r1=233(y1), r2=68(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 233
LDI r2, 68
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
