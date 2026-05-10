; DESCRIPTION: Places a cyan line segment connecting (420, 117) to (301, 110).
; PLAN: r0=420(x1), r1=117(y1), r2=301(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 117
LDI r2, 301
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
