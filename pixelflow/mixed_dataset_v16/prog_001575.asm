; DESCRIPTION: Places a cyan line segment connecting (134, 206) to (40, 205).
; PLAN: r0=134(x1), r1=206(y1), r2=40(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 206
LDI r2, 40
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
