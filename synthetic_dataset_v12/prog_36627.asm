; DESCRIPTION: Places a cyan line segment connecting (469, 207) to (38, 23).
; PLAN: r0=469(x1), r1=207(y1), r2=38(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 207
LDI r2, 38
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
