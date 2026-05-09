; DESCRIPTION: Draws a yellow line from (187, 168) to (288, 238).
; PLAN: r0=187(x1), r1=168(y1), r2=288(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 168
LDI r2, 288
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
