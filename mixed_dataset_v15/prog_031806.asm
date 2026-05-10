; DESCRIPTION: Places a cyan line segment connecting (102, 252) to (216, 175).
; PLAN: r0=102(x1), r1=252(y1), r2=216(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 252
LDI r2, 216
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
