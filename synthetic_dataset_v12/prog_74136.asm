; DESCRIPTION: Draws a cyan line from (122, 22) to (437, 34).
; PLAN: r0=122(x1), r1=22(y1), r2=437(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 22
LDI r2, 437
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
