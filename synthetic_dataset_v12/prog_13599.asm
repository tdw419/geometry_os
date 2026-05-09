; DESCRIPTION: Places a cyan line segment connecting (259, 198) to (443, 212).
; PLAN: r0=259(x1), r1=198(y1), r2=443(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 198
LDI r2, 443
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
