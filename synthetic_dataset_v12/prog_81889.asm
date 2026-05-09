; DESCRIPTION: Renders a black line between points (238, 189) and (479, 30).
; PLAN: r0=238(x1), r1=189(y1), r2=479(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 189
LDI r2, 479
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
