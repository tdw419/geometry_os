; DESCRIPTION: Places a cyan line segment connecting (292, 67) to (94, 149).
; PLAN: r0=292(x1), r1=67(y1), r2=94(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 67
LDI r2, 94
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
