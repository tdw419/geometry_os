; DESCRIPTION: Places a cyan line segment connecting (306, 66) to (443, 105).
; PLAN: r0=306(x1), r1=66(y1), r2=443(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 66
LDI r2, 443
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
