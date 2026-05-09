; DESCRIPTION: Draws a yellow line from (103, 80) to (383, 197).
; PLAN: r0=103(x1), r1=80(y1), r2=383(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 383
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
