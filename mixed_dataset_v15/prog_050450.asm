; DESCRIPTION: Places a cyan line segment connecting (296, 122) to (225, 233).
; PLAN: r0=296(x1), r1=122(y1), r2=225(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 122
LDI r2, 225
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
