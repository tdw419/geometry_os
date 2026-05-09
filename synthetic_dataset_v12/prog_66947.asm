; DESCRIPTION: Renders a black line between points (479, 115) and (97, 233).
; PLAN: r0=479(x1), r1=115(y1), r2=97(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 115
LDI r2, 97
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
