; DESCRIPTION: Places a cyan line segment connecting (162, 138) to (221, 41).
; PLAN: r0=162(x1), r1=138(y1), r2=221(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 138
LDI r2, 221
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
