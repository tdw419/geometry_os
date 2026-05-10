; DESCRIPTION: Places a green line segment connecting (96, 234) to (333, 43).
; PLAN: r0=96(x1), r1=234(y1), r2=333(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 234
LDI r2, 333
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
