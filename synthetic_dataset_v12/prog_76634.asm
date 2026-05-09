; DESCRIPTION: Draws a green line from (511, 39) to (38, 238).
; PLAN: r0=511(x1), r1=39(y1), r2=38(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 39
LDI r2, 38
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
