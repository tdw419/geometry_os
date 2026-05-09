; DESCRIPTION: Renders a black line between points (287, 111) and (311, 161).
; PLAN: r0=287(x1), r1=111(y1), r2=311(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 111
LDI r2, 311
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
