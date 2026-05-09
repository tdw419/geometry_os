; DESCRIPTION: Draws a blue line from (187, 128) to (226, 238).
; PLAN: r0=187(x1), r1=128(y1), r2=226(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 128
LDI r2, 226
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
