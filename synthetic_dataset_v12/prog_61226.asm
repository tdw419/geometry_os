; DESCRIPTION: Places a cyan line segment connecting (380, 217) to (202, 216).
; PLAN: r0=380(x1), r1=217(y1), r2=202(x2), r3=216(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 217
LDI r2, 202
LDI r3, 216
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
