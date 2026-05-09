; DESCRIPTION: Places a cyan line segment connecting (34, 155) to (485, 21).
; PLAN: r0=34(x1), r1=155(y1), r2=485(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 155
LDI r2, 485
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
