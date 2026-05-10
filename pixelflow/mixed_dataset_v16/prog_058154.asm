; DESCRIPTION: Draws a cyan line from (49, 83) to (353, 114).
; PLAN: r0=49(x1), r1=83(y1), r2=353(x2), r3=114(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 83
LDI r2, 353
LDI r3, 114
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
