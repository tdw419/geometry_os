; DESCRIPTION: Draws a yellow line from (197, 94) to (442, 62).
; PLAN: r0=197(x1), r1=94(y1), r2=442(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 94
LDI r2, 442
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
