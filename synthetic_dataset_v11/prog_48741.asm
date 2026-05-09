; DESCRIPTION: Places a yellow line segment connecting (160, 77) to (215, 238).
; PLAN: r0=160(x1), r1=77(y1), r2=215(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 77
LDI r2, 215
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
