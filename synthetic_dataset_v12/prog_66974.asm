; DESCRIPTION: Places a cyan line segment connecting (396, 198) to (386, 76).
; PLAN: r0=396(x1), r1=198(y1), r2=386(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 198
LDI r2, 386
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
