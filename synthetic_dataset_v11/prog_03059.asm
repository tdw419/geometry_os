; DESCRIPTION: Renders a purple line between points (29, 252) and (187, 236).
; PLAN: r0=29(x1), r1=252(y1), r2=187(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 252
LDI r2, 187
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
