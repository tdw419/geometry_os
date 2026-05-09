; DESCRIPTION: Draws a purple line from (462, 252) to (298, 167).
; PLAN: r0=462(x1), r1=252(y1), r2=298(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 252
LDI r2, 298
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
