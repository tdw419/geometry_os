; DESCRIPTION: Places a cyan line segment connecting (22, 19) to (438, 164).
; PLAN: r0=22(x1), r1=19(y1), r2=438(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 19
LDI r2, 438
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
