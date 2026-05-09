; DESCRIPTION: Renders a purple line between points (345, 176) and (366, 210).
; PLAN: r0=345(x1), r1=176(y1), r2=366(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 176
LDI r2, 366
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
