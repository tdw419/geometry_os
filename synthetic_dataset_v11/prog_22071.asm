; DESCRIPTION: Renders a black line between points (231, 167) and (49, 221).
; PLAN: r0=231(x1), r1=167(y1), r2=49(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 167
LDI r2, 49
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
