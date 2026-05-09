; DESCRIPTION: Renders a black line between points (501, 197) and (287, 167).
; PLAN: r0=501(x1), r1=197(y1), r2=287(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 197
LDI r2, 287
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
