; DESCRIPTION: Renders a blue line between points (319, 74) and (479, 217).
; PLAN: r0=319(x1), r1=74(y1), r2=479(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 74
LDI r2, 479
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
