; DESCRIPTION: Draws a green line from (38, 241) to (327, 137).
; PLAN: r0=38(x1), r1=241(y1), r2=327(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 241
LDI r2, 327
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
