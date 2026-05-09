; DESCRIPTION: Places a cyan line segment connecting (222, 1) to (181, 41).
; PLAN: r0=222(x1), r1=1(y1), r2=181(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 1
LDI r2, 181
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
