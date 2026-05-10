; DESCRIPTION: Draws a yellow line from (76, 238) to (33, 8).
; PLAN: r0=76(x1), r1=238(y1), r2=33(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 238
LDI r2, 33
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
