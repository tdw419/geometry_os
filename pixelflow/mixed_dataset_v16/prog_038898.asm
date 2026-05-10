; DESCRIPTION: Places a cyan line segment connecting (431, 26) to (333, 70).
; PLAN: r0=431(x1), r1=26(y1), r2=333(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 26
LDI r2, 333
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
