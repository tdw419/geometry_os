; DESCRIPTION: Places a cyan line segment connecting (135, 192) to (176, 104).
; PLAN: r0=135(x1), r1=192(y1), r2=176(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 192
LDI r2, 176
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
