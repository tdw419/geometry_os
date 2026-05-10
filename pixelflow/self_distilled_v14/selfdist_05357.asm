; DESCRIPTION: Draws a green line from (241, 153) to (176, 131).
; PLAN: r0=241(x1), r1=153(y1), r2=176(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 153
LDI r2, 176
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
