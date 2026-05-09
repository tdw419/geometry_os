; DESCRIPTION: Places a cyan line segment connecting (108, 161) to (431, 136).
; PLAN: r0=108(x1), r1=161(y1), r2=431(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 161
LDI r2, 431
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
