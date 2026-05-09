; DESCRIPTION: Places a cyan line segment connecting (82, 34) to (84, 149).
; PLAN: r0=82(x1), r1=34(y1), r2=84(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 34
LDI r2, 84
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
