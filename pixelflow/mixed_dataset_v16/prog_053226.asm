; DESCRIPTION: Draws a green line from (411, 221) to (70, 241).
; PLAN: r0=411(x1), r1=221(y1), r2=70(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 221
LDI r2, 70
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
