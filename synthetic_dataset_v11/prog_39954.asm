; DESCRIPTION: Places a cyan line segment connecting (105, 217) to (161, 231).
; PLAN: r0=105(x1), r1=217(y1), r2=161(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 217
LDI r2, 161
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
