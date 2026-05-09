; DESCRIPTION: Draws a green line from (48, 80) to (477, 238).
; PLAN: r0=48(x1), r1=80(y1), r2=477(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 80
LDI r2, 477
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
