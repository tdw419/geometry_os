; DESCRIPTION: Renders a black line between points (196, 74) and (479, 185).
; PLAN: r0=196(x1), r1=74(y1), r2=479(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 74
LDI r2, 479
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
