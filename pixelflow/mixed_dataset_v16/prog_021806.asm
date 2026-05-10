; DESCRIPTION: Places a cyan line segment connecting (344, 207) to (94, 237).
; PLAN: r0=344(x1), r1=207(y1), r2=94(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 207
LDI r2, 94
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
