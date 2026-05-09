; DESCRIPTION: Places a cyan line segment connecting (69, 144) to (11, 41).
; PLAN: r0=69(x1), r1=144(y1), r2=11(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 144
LDI r2, 11
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
