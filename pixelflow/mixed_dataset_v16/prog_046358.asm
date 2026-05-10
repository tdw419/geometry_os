; DESCRIPTION: Renders a purple line between points (479, 202) and (146, 79).
; PLAN: r0=479(x1), r1=202(y1), r2=146(x2), r3=79(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 202
LDI r2, 146
LDI r3, 79
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
