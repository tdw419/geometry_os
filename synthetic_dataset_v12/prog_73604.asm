; DESCRIPTION: Draws a green line from (437, 192) to (340, 238).
; PLAN: r0=437(x1), r1=192(y1), r2=340(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 192
LDI r2, 340
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
