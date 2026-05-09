; DESCRIPTION: Places a cyan line segment connecting (192, 123) to (206, 175).
; PLAN: r0=192(x1), r1=123(y1), r2=206(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 123
LDI r2, 206
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
