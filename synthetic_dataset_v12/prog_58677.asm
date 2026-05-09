; DESCRIPTION: Renders a red line between points (479, 230) and (260, 130).
; PLAN: r0=479(x1), r1=230(y1), r2=260(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 230
LDI r2, 260
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
