; DESCRIPTION: Draws a green line from (350, 221) to (505, 58).
; PLAN: r0=350(x1), r1=221(y1), r2=505(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 221
LDI r2, 505
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
