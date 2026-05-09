; DESCRIPTION: Places a cyan line segment connecting (216, 111) to (252, 161).
; PLAN: r0=216(x1), r1=111(y1), r2=252(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 111
LDI r2, 252
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
