; DESCRIPTION: Renders a black line between points (479, 146) and (507, 54).
; PLAN: r0=479(x1), r1=146(y1), r2=507(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 146
LDI r2, 507
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
