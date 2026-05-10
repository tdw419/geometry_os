; DESCRIPTION: Places a cyan line segment connecting (326, 35) to (185, 121).
; PLAN: r0=326(x1), r1=35(y1), r2=185(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 35
LDI r2, 185
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
