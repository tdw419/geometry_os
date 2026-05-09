; DESCRIPTION: Places a cyan line segment connecting (37, 67) to (4, 41).
; PLAN: r0=37(x1), r1=67(y1), r2=4(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 67
LDI r2, 4
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
