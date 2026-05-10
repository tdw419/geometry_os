; DESCRIPTION: Renders a black line between points (113, 197) and (311, 176).
; PLAN: r0=113(x1), r1=197(y1), r2=311(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 197
LDI r2, 311
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
