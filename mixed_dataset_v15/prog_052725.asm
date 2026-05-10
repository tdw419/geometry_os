; DESCRIPTION: Renders a green line between points (158, 216) and (296, 213).
; PLAN: r0=158(x1), r1=216(y1), r2=296(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 216
LDI r2, 296
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
