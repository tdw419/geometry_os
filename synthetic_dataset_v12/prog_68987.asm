; DESCRIPTION: Draws a purple line from (76, 128) to (27, 238).
; PLAN: r0=76(x1), r1=128(y1), r2=27(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 128
LDI r2, 27
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
