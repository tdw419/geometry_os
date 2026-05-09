; DESCRIPTION: Draws a black line from (62, 108) to (197, 190).
; PLAN: r0=62(x1), r1=108(y1), r2=197(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 108
LDI r2, 197
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
