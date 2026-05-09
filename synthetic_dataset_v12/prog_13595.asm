; DESCRIPTION: Draws a red line from (94, 0) to (197, 26).
; PLAN: r0=94(x1), r1=0(y1), r2=197(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 0
LDI r2, 197
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
