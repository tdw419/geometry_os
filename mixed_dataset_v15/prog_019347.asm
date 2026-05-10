; DESCRIPTION: Renders a purple line between points (479, 124) and (269, 115).
; PLAN: r0=479(x1), r1=124(y1), r2=269(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 124
LDI r2, 269
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
