; DESCRIPTION: Places a cyan line segment connecting (76, 159) to (18, 197).
; PLAN: r0=76(x1), r1=159(y1), r2=18(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 159
LDI r2, 18
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
