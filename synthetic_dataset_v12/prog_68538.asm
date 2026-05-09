; DESCRIPTION: Places a cyan line segment connecting (438, 85) to (485, 57).
; PLAN: r0=438(x1), r1=85(y1), r2=485(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 85
LDI r2, 485
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
